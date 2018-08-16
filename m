From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v3 13/25] xen/arm: introduce create_domUs
Date: Thu, 16 Aug 2018 11:20:02 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1808161119360.16354@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1807311623060.5781@sstabellini-ThinkPad-X260>
 <1533079688-9541-13-git-send-email-sstabellini@kernel.org>
 <ebf9dbfc-4d90-3a15-0ec1-12fb7a5e72ee@arm.com>
 <alpine.DEB.2.10.1808151239270.15066@sstabellini-ThinkPad-X260>
 <691e4662-6f0c-17d2-25e2-837db1773190@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <691e4662-6f0c-17d2-25e2-837db1773190@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Stefano Stabellini <stefanos@xilinx.com>, Stefano Stabellini <sstabellini@kernel.org>, andrii_anisov@epam.com, andrew.cooper3@citrix.com, xen-devel@lists.xen.org, jbeulich@suse.com
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCAxNiBBdWcgMjAxOCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpIFN0ZWZhbm8sCj4g
Cj4gT24gMDgvMTUvMjAxOCAwOTowNCBQTSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+ID4g
T24gTW9uLCAxMyBBdWcgMjAxOCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+ID4gPiA+ICt2b2lkIF9f
aW5pdCBjcmVhdGVfZG9tVXModm9pZCkKPiA+ID4gPiArewo+ID4gPiA+ICsgICAgc3RydWN0IGR0
X2RldmljZV9ub2RlICpub2RlOwo+ID4gPiA+ICsgICAgc3RydWN0IGR0X2RldmljZV9ub2RlICpj
aG9zZW4gPSBkdF9maW5kX25vZGVfYnlfbmFtZShkdF9ob3N0LAo+ID4gPiA+ICJjaG9zZW4iKTsK
PiA+ID4gPiArCj4gPiA+ID4gKyAgICBpZiAoIGNob3NlbiAhPSBOVUxMICkKPiA+ID4gPiArICAg
IHsKPiA+ID4gPiArICAgICAgICBkdF9mb3JfZWFjaF9jaGlsZF9ub2RlKGNob3Nlbiwgbm9kZSkK
PiA+ID4gPiArICAgICAgICB7Cj4gPiA+ID4gKyAgICAgICAgICAgIHN0cnVjdCBkb21haW4gKmQ7
Cj4gPiA+ID4gKyAgICAgICAgICAgIHN0cnVjdCB4ZW5fZG9tY3RsX2NyZWF0ZWRvbWFpbiBkX2Nm
ZyA9IHsKPiA+ID4gPiArICAgICAgICAgICAgICAgIC5hcmNoLmdpY192ZXJzaW9uID0gWEVOX0RP
TUNUTF9DT05GSUdfR0lDX05BVElWRSwKPiA+ID4gPiArICAgICAgICAgICAgICAgIC5hcmNoLm5y
X3NwaXMgPSAzMiwKPiA+ID4gCj4gPiA+IEFGQUlDVCwgd2hlbiBjcmVhdGluZyBEb21VIGZyb20g
dGhlIHRvb2xzdGFjayBucl9zcGlzIHdpbGwgYmUgMC4gU28gd2h5IDMyCj4gPiA+IGhlcmU/Cj4g
PiAKPiA+IExlZ2FjeSBmcm9tIGRlYnVnIGNvZGUuIEl0IHNob3VsZCBiZSAwLCB1bmxlc3MgdnBs
MDExIGlzIGVuYWJsZWQsIGluCj4gPiB3aGljaCBjYXNlIGl0IHNob3VsZCBiZSAxLgo+IAo+IEkg
d291bGQgcHJlZmVyIGlmIHdlIHVzZSBHVUVTVF9WUEwwMTFfU1BJIC0gMzIuIFRoaXMgd291bGQg
bWFrZSB0aGUgY29kZQo+IGJ1bGxldC1wcm9vZiBmb3IgYW55IHBvdGVudGlhbCByZXNodWZmbGUg
b2YgdGhlIElSUXMuCgpPSywgSSdsbCBkbyB0aGF0LiBJdCBpcyBhY3R1YWxseSBHVUVTVF9WUEww
MTFfU1BJIC0gMzIgKyAxLgooR1VFU1RfVlBMMDExX1NQSSAtIDMyIGlzIDAuKQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
