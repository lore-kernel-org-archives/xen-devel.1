From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH v2 06/13] public / x86: introduce
 __HYPERCALL_iommu_op
Date: Mon, 16 Jul 2018 14:17:55 +0000
Message-ID: <13b0c83b2c2345959c225e08154827d7@AMSPEX02CL02.citrite.net>
References: <20180707110526.35822-1-paul.durrant@citrix.com>
 <20180707110526.35822-7-paul.durrant@citrix.com>
 <20180716141423.xvxglw6y54binzeh@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=tukk=ka=citrix.com=prvs=728920bf3=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1ff4KN-0004ZG-U0
 for xen-devel@lists.xenproject.org; Mon, 16 Jul 2018 14:18:15 +0000
In-Reply-To: <20180716141423.xvxglw6y54binzeh@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim (Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Ian Jackson <Ian.Jackson@citrix.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IFdlaSBMaXUgW21haWx0bzp3ZWku
bGl1MkBjaXRyaXguY29tXQo+IFNlbnQ6IDE2IEp1bHkgMjAxOCAxNToxNAo+IFRvOiBQYXVsIER1
cnJhbnQgPFBhdWwuRHVycmFudEBjaXRyaXguY29tPgo+IENjOiB4ZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmc7IEFuZHJldyBDb29wZXIKPiA8QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT47
IEdlb3JnZSBEdW5sYXAKPiA8R2VvcmdlLkR1bmxhcEBjaXRyaXguY29tPjsgSWFuIEphY2tzb24g
PElhbi5KYWNrc29uQGNpdHJpeC5jb20+OyBKYW4KPiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNv
bT47IEtvbnJhZCBSemVzenV0ZWsgV2lsawo+IDxrb25yYWQud2lsa0BvcmFjbGUuY29tPjsgU3Rl
ZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsgVGltCj4gKFhlbi5vcmcp
IDx0aW1AeGVuLm9yZz47IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+OyBEYW5pZWwgRGUg
R3JhYWYKPiA8ZGdkZWdyYUB0eWNoby5uc2EuZ292Pgo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIg
MDYvMTNdIHB1YmxpYyAvIHg4NjogaW50cm9kdWNlCj4gX19IWVBFUkNBTExfaW9tbXVfb3AKPiAK
PiBPbiBTYXQsIEp1bCAwNywgMjAxOCBhdCAxMjowNToxOVBNICswMTAwLCBQYXVsIER1cnJhbnQg
d3JvdGU6Cj4gPiBUaGlzIHBhdGNoIGludHJvZHVjZXMgdGhlIGJvaWxlcnBsYXRlIGZvciBhIG5l
dyBoeXBlcmNhbGwgdG8gYWxsb3cgYQo+ID4gZG9tYWluIHRvIGNvbnRyb2wgSU9NTVUgbWFwcGlu
Z3MgZm9yIGl0cyBvd24gcGFnZXMuCj4gPiBXaGlsc3QgdGhlcmUgaXMgZHVwbGljYXRpb24gb2Yg
Y29kZSBiZXR3ZWVuIHRoZSBuYXRpdmUgYW5kIGNvbXBhdCBlbnRyeQo+ID4gcG9pbnRzIHdoaWNo
IGFwcGVhcnMgcmlwZSBmb3Igc29tZSBmb3JtIG9mIGNvbWJpbmF0aW9uLCBJIHRoaW5rIGl0IGlz
Cj4gPiBiZXR0ZXIgdG8gbWFpbnRhaW4gdGhlIHNlcGFyYXRpb24gYXMtaXMgYmVjYXVzZSB0aGUg
Y29tcGF0IGVudHJ5IHBvaW50Cj4gPiB3aWxsIG5lY2Vzc2FyaWx5IGdhaW4gY29tcGxleGl0eSBp
biBzdWJzZXF1ZW50IHBhdGNoZXMuCj4gPgo+IAo+IFNpbmNlIHRoaXMgaXMgYSBuZXcgb3AsIHdo
eSBpcyB0aGVyZSBjb21wYXRpYmlsaXR5IGlzc3VlPyBDYW4gd2UgZG8gYXdheQo+IHdpdGggdGhl
IGNvbXBhdCBlbnRyeSBwb2ludCBhbGwgdG9nZXRoZXI/Cj4gCj4gSSBoYXZlbid0IHJlYWQgdGhl
IHJlc3Qgb2YgdGhpcyBzZXJpZXMsIG1heWJlIGl0IHdpbGwgYmVjb21lIGNsZWFyZXIKPiBsYXRl
ci4KCkxvb2sgYXQgdGhlIHBhdGNoIGFkZGluZyB0aGUgcXVlcnkgb3AuLi4gdGhhdCdzIHdoZW4g
aXQgYmVjb21lcyBuZWNlc3NhcnkuCgogIFBhdWwKCj4gCj4gV2VpLgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
