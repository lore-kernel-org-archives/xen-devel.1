From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH v14 4/9] iommu: don't domain_crash() inside
 iommu_map/unmap_page()
Date: Fri, 5 Oct 2018 09:02:51 +0000
Message-ID: <dc09b38c8b4946f6b2ba60a7e987e7e3@AMSPEX02CL03.citrite.net>
References: <20181004104547.32316-1-paul.durrant@citrix.com>
 <20181004104547.32316-5-paul.durrant@citrix.com>
 <37e5e689-110e-6bc4-1a54-8401d58dc282@citrix.com>
 <456a887cbf714c2f84c2548168df1b97@AMSPEX02CL03.citrite.net>
 <5BB713B302000078001EEA3E@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=qlgr=mr=citrix.com=prvs=8099faa14=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1g8M0d-00023r-BF
 for xen-devel@lists.xenproject.org; Fri, 05 Oct 2018 09:02:55 +0000
In-Reply-To: <5BB713B302000078001EEA3E@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: 'Jan Beulich' <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim (Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson <Ian.Jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEphbiBCZXVsaWNoIFttYWlsdG86
SkJldWxpY2hAc3VzZS5jb21dCj4gU2VudDogMDUgT2N0b2JlciAyMDE4IDA4OjMzCj4gVG86IFBh
dWwgRHVycmFudCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+Cj4gQ2M6IEFuZHJldyBDb29wZXIg
PEFuZHJldy5Db29wZXIzQGNpdHJpeC5jb20+OyBHZW9yZ2UgRHVubGFwCj4gPEdlb3JnZS5EdW5s
YXBAY2l0cml4LmNvbT47IElhbiBKYWNrc29uIDxJYW4uSmFja3NvbkBjaXRyaXguY29tPjsgV2Vp
IExpdQo+IDx3ZWkubGl1MkBjaXRyaXguY29tPjsgSnVuIE5ha2FqaW1hIDxqdW4ubmFrYWppbWFA
aW50ZWwuY29tPjsgU3RlZmFubwo+IFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+
OyB4ZW4tZGV2ZWwgPHhlbi0KPiBkZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZz47IEtvbnJhZCBS
emVzenV0ZWsgV2lsawo+IDxrb25yYWQud2lsa0BvcmFjbGUuY29tPjsgVGltIChYZW4ub3JnKSA8
dGltQHhlbi5vcmc+Cj4gU3ViamVjdDogUmU6IFtYZW4tZGV2ZWxdIFtQQVRDSCB2MTQgNC85XSBp
b21tdTogZG9uJ3QgZG9tYWluX2NyYXNoKCkKPiBpbnNpZGUgaW9tbXVfbWFwL3VubWFwX3BhZ2Uo
KQo+IAo+ID4+PiBPbiAwNC4xMC4xOCBhdCAxODozNiwgPFBhdWwuRHVycmFudEBjaXRyaXguY29t
PiB3cm90ZToKPiA+IEkgc3RpbGwgdGhpbmsgYW4gaW1wbGljaXQgZG9tYWluX2NyYXNoKCkgZG9l
c24ndCByZWFsbHkgYmVsb25nIGluCj4gc29tZXRoaW5nCj4gPiB0aGF0IGxvb2tzIGxpa2UgYSBz
dHJhaWdodGZvcndhcmQgd3JhcHBlciBhcm91bmQgYSBwZXItaW1wbGVtZW50YXRpb24KPiBqdW1w
Cj4gPiB0YWJsZS4gSG93IGFib3V0IGlvbW11X21hcC91bm1hcF9tYXlfY3Jhc2goKSBpbnN0ZWFk
IHRvIGhpZ2hsaWdodCB0aGUKPiA+IHNlbWFudGljPwo+IAo+IElmIGFueXRoaW5nIHRoZW4gdGhl
IG90aGVyIHdheSBhcm91bmQsIGkuZS4gaW9tbXVfdW5tYXBfbm9fY3Jhc2goKSwKPiBzdWNoIHRo
YXQgb25seSBjYWxsZXJzIHdobyBleHBsaWNpdGx5IG1lYW4gdG8gZGVhbCB3aXRoIHRoZSBjcmFz
aGluZwo+IHRoZW1zZWx2ZXMgd291bGQgdXNlIHRoZSBvdGhlcndpc2UgaW5zZWN1cmUgdmFyaWFu
dC4KPgoKT2suIEdlb3JnZSwgd2hhdCBpcyB5b3VyIHByZWZlcmVuY2U/CgpBdCB0aGlzIHBvaW50
IG15IHByb3Bvc2FsIGlzIHRvIGRyb3AgdGhpcyBwYXRjaCBhbmQgcmVwbGFjZSBpdCB3aXRoIG9u
ZSB0aGF0IHJlbW92ZXMgdGhlIGltcGxpY2l0IGNyYXNoIGZyb20gZnJvbSBldmVyeXRoaW5nIGV4
Y2VwdCB0aGUgdW5tYXAuIEkgY2FuIHRoZW4gaW50cm9kdWNlIGEgJ25vY3Jhc2gnIHZhcmlhbnQg
b2YgdW5tYXAgaWYgSSBuZWVkIGl0Li4uIGFsdGhvdWdoIEknbSBubyBsb25nZXIgY29udmluY2Vk
IEkgY2FuIHJlYWxseSBkbyBhbnl0aGluZyBlbHNlIGlmIGEgUFYtSU9NTVUgdW5tYXAgZmFpbHMu
CgogIFBhdWwKCj4gSmFuCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
