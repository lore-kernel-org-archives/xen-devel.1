From: "Woods, Brian" <Brian.Woods@amd.com>
Subject: Re: [PATCH v3] amd-iommu: remove page merging code
Date: Tue, 4 Dec 2018 23:31:02 +0000
Message-ID: <20181204233059.GA15167@amd.com>
References: <20181128095559.5101-1-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=mcfj=on=amd.com=brian.woods@srs-us1.protection.inumbo.net>)
 id 1gUK9j-00080G-HT
 for xen-devel@lists.xenproject.org; Tue, 04 Dec 2018 23:31:07 +0000
In-Reply-To: <20181128095559.5101-1-paul.durrant@citrix.com>
Content-Language: en-US
Content-ID: <1FE2BF0D0C8D744B8116B9A7719CA56B@namprd12.prod.outlook.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Woods,
 Brian" <Brian.Woods@amd.com>, "Suthikulpanit,
 Suravee" <Suravee.Suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBOb3YgMjgsIDIwMTggYXQgMDk6NTU6NTlBTSArMDAwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IFRoZSBwYWdlIG1lcmdpbmcgbG9naWMgbWFrZXMgdXNlIG9mIGJpdHMgMS04IGFuZCBi
aXQgNjMgb2YgYSBQVEUsIHdoaWNoCj4gdXNlZCB0byBiZSBzcGVjaWZpZWQgYXMgJ2lnbm9yZWQn
LiBIb3dldmVyLCBiaXRzIDUgYW5kIDYgYXJlIG5vdyBzcGVjaWZpZWQKPiBhcyAnYWNjZXNzZWQn
IGFuZCAnZGlydHknIGJpdHMgYW5kIHRoZWlyIHVzZSBvbmx5IHJlbWFpbnMgc2FmZSBhcyBsb25n
IGFzCj4gdGhlIERURSAnSG9zdCBBY2Nlc3MgRGlydHknIGJpdHMgcmVtYWluIHVudXNlZCBieSBY
ZW4sIG9yIGJ5IGhhcmR3YXJlCj4gYmVmb3JlIHRoZSBkb21haW4gc3RhcnRzIHJ1bm5pbmcuIChY
U0EtMjc1IGRpc2FibGVkIHRoZSBvcGVyYXRpb24gb2YgdGhlCj4gY29kZSBhZnRlciBkb21haW4g
Y3JlYXRpb24gY29tcGxldGVzKS4KPiAKPiBXaXRoIHRoZSBwYWdlIG1lcmdpbmcgbG9naWMgcHJl
c2VudCBpbiBpdHMgY3VycmVudCBmb3JtIHRoZXJlIGFyZSBubyBzcGFyZQo+IGlnbm9yZWQgYml0
cyBpbiB0aGUgUFRFIGF0IGFsbCwgYnV0IFBWLUlPTU1VIHN1cHBvcnQgd2lsbCByZXF1aXJlIGF0
IGxlYXN0Cj4gb25lIHNwYXJlIGJpdCB0byB0cmFjayB3aGljaCBQVEVzIGFyZSBhZGRlZCBieSBo
eXBlcmNhbGwuCj4gCj4gVGhpcyBwYXRjaCByZW1vdmVzIHRoZSBjb2RlLCBmcmVlaW5nIHVwIHRo
ZSByZW1haW5pbmcgUFRFIGlnbm9yZWQgYml0cwo+IGZvciBvdGhlciB1c2UsIGluY2x1ZGluZyBQ
Vi1JT01NVSBzdXBwb3J0LCBhcyB3ZWxsIGFzIHNpZ25pZmljYW50bHkKPiBzaW1wbGlmeWluZyBh
bmQgc2hvcnRlbmluZyB0aGUgc291cmNlIGJ5IH4xNzAgbGluZXMuIFRoZXJlIG1heSBiZSBzb21l
Cj4gbWFyZ2luYWwgcGVyZm9ybWFuY2UgY29zdCAoYnV0IG5vbmUgaGFzIGJlZW4gb2JzZXJ2ZWQg
aW4gbWFudWFsIHRlc3RpbmcKPiB3aXRoIGEgcGFzc2VkLXRocm91Z2ggTlZJRElBIEdQVSkgc2lu
Y2UgaGlnaGVyIG9yZGVyIG1hcHBpbmdzIHdpbGwgbm93IGJlCj4gcnVsZWQgb3V0IHVudGlsIGEg
bWFwcGluZyBvcmRlciBwYXJhbWV0ZXIgaXMgcGFzc2VkIHRvIGlvbW11X29wcy4gVGhhdCB3aWxs
Cj4gYmUgZGVhbHQgd2l0aCBieSBhIHN1YnNlcXVlbnQgcGF0Y2ggdGhvdWdoLgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+CgpBY2tlZC1i
eTogQnJpYW4gV29vZHMgPGJyaWFuLndvb2RzQGFtZC5jb20+CgotLSAKQnJpYW4gV29vZHMKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
