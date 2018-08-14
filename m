From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH] libs/foreignmemory: Avoid printing an error
 for ENOTSUPP
Date: Tue, 14 Aug 2018 07:53:17 +0000
Message-ID: <5bc23659d5d54ec291972b11c6fa5f98@AMSPEX02CL03.citrite.net>
References: <20180813173325.14697-1-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=fuuh=k5=citrix.com=prvs=757da4842=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1fpU8n-0003bq-I1
 for xen-devel@lists.xenproject.org; Tue, 14 Aug 2018 07:53:21 +0000
In-Reply-To: <20180813173325.14697-1-julien.grall@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: 'Julien Grall' <julien.grall@arm.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Ian Jackson <Ian.Jackson@citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEp1bGllbiBHcmFsbCBbbWFpbHRv
Omp1bGllbi5ncmFsbEBhcm0uY29tXQo+IFNlbnQ6IDEzIEF1Z3VzdCAyMDE4IDE4OjMzCj4gVG86
IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwo+IENjOiBJYW4gSmFja3NvbiA8SWFuLkph
Y2tzb25AY2l0cml4LmNvbT47IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Owo+IFBhdWwg
RHVycmFudCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+OyBKdWxpZW4gR3JhbGwgPGp1bGllbi5n
cmFsbEBhcm0uY29tPgo+IFN1YmplY3Q6IFtQQVRDSF0gbGlicy9mb3JlaWdubWVtb3J5OiBBdm9p
ZCBwcmludGluZyBhbiBlcnJvciBmb3IgRU5PVFNVUFAKPiAKPiBSZXNvdXJjZSBtYXBwaW5nIGlz
IG5vdCBzdXBwb3J0ZWQgb24gQXJtIGFuZCByZXN1bHRzIHRvIGFuIGVycm9yIG1lc3NhZ2UKPiBh
dCBldmVyeSBndWVzdCBib290Ogo+IAo+IHhlbmZvcmVpZ25tZW1vcnk6IGVycm9yOiBpb2N0bCBm
YWlsZWQ6IE9wZXJhdGlvbiBub3Qgc3VwcG9ydGVkCj4gCj4gSGlkZSB0aGUgZXJyb3IgbWVzc2Fn
ZSB3aGVuIGVycm5vciBpcyBFTk9UU1VQUC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3Jh
bGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgoKUmV2aWV3ZWQtYnk6IFBhdWwgRHVycmFudCA8cGF1
bC5kdXJyYW50QGNpdHJpeC5jb20+Cgo+IC0tLQo+ICB0b29scy9saWJzL2ZvcmVpZ25tZW1vcnkv
bGludXguYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnMvZm9yZWlnbm1lbW9yeS9saW51eC5j
Cj4gYi90b29scy9saWJzL2ZvcmVpZ25tZW1vcnkvbGludXguYwo+IGluZGV4IGE2YjQxYjBiN2Yu
LjM2ODZjZjQxZTAgMTAwNjQ0Cj4gLS0tIGEvdG9vbHMvbGlicy9mb3JlaWdubWVtb3J5L2xpbnV4
LmMKPiArKysgYi90b29scy9saWJzL2ZvcmVpZ25tZW1vcnkvbGludXguYwo+IEBAIC0zMDcsNyAr
MzA3LDcgQEAgaW50IG9zZGVwX3hlbmZvcmVpZ25tZW1vcnlfbWFwX3Jlc291cmNlKAo+ICAgICAg
ewo+ICAgICAgICAgIGludCBzYXZlZF9lcnJubzsKPiAKPiAtICAgICAgICBpZiAoIGVycm5vICE9
IEVOT1RUWSApCj4gKyAgICAgICAgaWYgKCBlcnJubyAhPSBFTk9UVFkgJiYgZXJybm8gIT0gRU9Q
Tk9UU1VQUCApCj4gICAgICAgICAgICAgIFBFUlJPUigiaW9jdGwgZmFpbGVkIik7Cj4gICAgICAg
ICAgZWxzZQo+ICAgICAgICAgICAgICBlcnJubyA9IEVPUE5PVFNVUFA7Cj4gLS0KPiAyLjExLjAK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
