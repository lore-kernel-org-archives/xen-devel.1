From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 0/3] automation: build Xen on Arm64
Date: Tue, 13 Nov 2018 13:01:05 +0000
Message-ID: <20181113130105.do34bl3nskppi7wm@zion.uk.xensource.com>
References: <20181107123149.4751-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ps9l=ny=citrix.com=prvs=8480012eb=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gMYJb-0002Ir-Lt
 for xen-devel@lists.xenproject.org; Tue, 13 Nov 2018 13:01:11 +0000
Content-Disposition: inline
In-Reply-To: <20181107123149.4751-1-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Lars Kurth <lars.kurth@citrix.com>, Julien Grall <julien.grall@arm.com>, Wei Liu <wei.liu2@citrix.com>, Doug Goldstein <cardoe@cardoe.com>
List-Id: xen-devel@lists.xenproject.org

RG91Zz8KCihTb3JyeSB5b3Ugd2VyZW4ndCBDQydlZCBvbiB0aGUgY292ZXIgbGV0dGVyKQoKT24g
V2VkLCBOb3YgMDcsIDIwMTggYXQgMTI6MzE6NDZQTSArMDAwMCwgV2VpIExpdSB3cm90ZToKPiBI
aSBhbGwKPiAKPiBUaGlzIGlzIG15IGZpcnN0IGF0dGVtcHQgdG8gcXVpY2tseSBnZXQgc29tZXRo
aW5nIHVzZWZ1bCBmb3IgQXJtIGluIEdpdGxhYiBDSQo+IHdpdGggYSBtYWNoaW5lIGJvcnJvd2Vk
IGZyb20gUGFja2V0Lm5ldC4KPiAKPiBUaGUgcnVubmVyIGlzIGNvbmZpZ3VyZWQgbWFudWFsbHkg
YXQgdGhlIG1vbWVudCAoc2VlIGJlbG93KS4gSXQgaXMgdGFnZ2VkIHdpdGgKPiBhcm0sYXJtNjQs
ZG9ja2VyIHNvIGl0IHdpbGwgb25seSBydW4gQXJtNjQgam9icy4gSWRlYWx5IHdlIHNob3VsZCBi
dWlsZCBpdCB3aXRoCj4gVGVycmFmb3JtIGFzIHdlbGwuIFRoZXJlIGlzIFBhY2tldC5uZXQgQVBJ
IHN1cHBvcnQgZm9yIFRlcnJhZm9ybSBidXQgSSBkb24ndAo+IGhhdmUgdGltZSB0byByZWFkIHRo
ZWlyIGRvY3VtZW50YXRpb24uCj4gCj4gSSBoYXZlIGJ1aWx0IGEgYmFzZSBpbWFnZSBmb3IgQXJt
IGFuZCBwdXNoZWQgaXQgdG8gR2l0bGFiIGRvY2tlciByZXBvc2l0b3J5Lgo+IEJ1aWxkaW5nIGFu
IGltYWdlIHJlcXVpcmVzIGFuIG5hdGl2ZSBBcm0gZW52aXJvbm1lbnQuCj4gCj4gV2Ugc2hvdWxk
IGFsc28gcHJvYmFibHkgcmVmYWN0b3IgLmdpdGxhYi1jaS55bWwgYSBiaXQuCj4gCj4gV2VpLgo+
IAo+IENvbW1hbmQgdG8gcmVnaXN0ZXIgdGhlIHJ1bm5lcjoKPiBnaXRsYWItcnVubmVyIHJlZ2lz
dGVyIC0tbm9uLWludGVyYWN0aXZlIC1yICR7Z2l0bGFiX3Rva2VufSAtLWxvY2tlZCAtLXVybCBc
IAo+IGh0dHBzOi8vZ2l0bGFiLmNvbSAtLWV4ZWN1dG9yIGRvY2tlciAtLXRhZy1saXN0IGFybSxh
cm02NCxkb2NrZXIgLS1kb2NrZXItaW1hZ2UgXAo+IHJ1Ynk6Mi4xCj4gCj4gV2VpIExpdSAoMyk6
Cj4gICBhdXRvbWF0aW9uOiBhZGQgZGViaWFuIHVuc3RhYmxlIGFybTY0djggaW1hZ2UKPiAgIGF1
dG9tYXRpb246IGFkZCB0d28gQXJtNjQgYnVpbGRzIHRvIEdpdGxhYiBDSQo+ICAgYXV0b21hdGlv
bjogbGlmdCB0b29scyBidWlsZCByZXN0cmljdGlvbiBpbiBidWlsZCBzY3JpcHQKPiAKPiAgLmdp
dGxhYi1jaS55bWwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAyMiArKysr
KysrKysrCj4gIC4uLi9idWlsZC9kZWJpYW4vdW5zdGFibGUtYXJtNjR2OC5kb2NrZXJmaWxlICAg
ICAgIHwgNDggKysrKysrKysrKysrKysrKysrKysrKwo+ICBhdXRvbWF0aW9uL3NjcmlwdHMvYnVp
bGQgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICA2IC0tLQo+ICAzIGZpbGVzIGNoYW5nZWQs
IDcwIGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBh
dXRvbWF0aW9uL2J1aWxkL2RlYmlhbi91bnN0YWJsZS1hcm02NHY4LmRvY2tlcmZpbGUKPiAKPiAt
LSAKPiAyLjExLjAKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
