From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 5/7] x86: relocate pvh_info
Date: Mon, 22 Jan 2018 12:44:41 +0000
Message-ID: <20180122124441.26ojjq6kl3m3nnig@MacBook-Pro-de-Roger.local>
References: <20180119153458.22535-1-wei.liu2@citrix.com>
 <20180119153458.22535-6-wei.liu2@citrix.com>
 <20180119162931.3mcwyzqya6wb2r7h@MacBook-Pro-de-Roger.local>
 <20180119163900.auf6tkm7o2vjvy5g@citrix.com>
 <5A65CB8A02000078001A0FC8@prv-mh.provo.novell.com>
 <20180122123521.vbeuvdiau2jaolpk@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=ksin=er=citrix.com=prvs=553107298=roger.pau@srs-us1.protection.inumbo.net>)
 id 1edbT4-0002Sq-7f
 for xen-devel@lists.xenproject.org; Mon, 22 Jan 2018 12:44:54 +0000
Content-Disposition: inline
In-Reply-To: <20180122123521.vbeuvdiau2jaolpk@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBKYW4gMjIsIDIwMTggYXQgMTI6MzU6MjFQTSArMDAwMCwgV2VpIExpdSB3cm90ZToK
PiBUbyBhdm9pZCBzcGFtbWluZyB0aGUgbGlzdCB3aXRoIGFsbCB0aGUgb3RoZXIgYWNrZWQgcGF0
Y2hlcywgaGVyZSBpcyB0aGUKPiB1cGRhdGVkIHBhdGNoLgo+IAo+IC0tLTg8LS0tCj4gRnJvbSAx
YWMwYWZiYmMwZWNkNjIwYzVmYmEzYTAzYmIwODRiYzRkYWZjNzhlIE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQo+IEZyb206IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Cj4gRGF0ZTogV2Vk
LCAxNyBKYW4gMjAxOCAxODozODowMiArMDAwMAo+IFN1YmplY3Q6IFtQQVRDSF0geDg2OiByZWxv
Y2F0ZSBwdmhfaW5mbwo+IE1JTUUtVmVyc2lvbjogMS4wCj4gQ29udGVudC1UeXBlOiB0ZXh0L3Bs
YWluOyBjaGFyc2V0PVVURi04Cj4gQ29udGVudC1UcmFuc2Zlci1FbmNvZGluZzogOGJpdAo+IAo+
IE1vZGlmeSBlYXJseSBib290IGNvZGUgdG8gcmVsb2NhdGUgcHZoIGluZm8gYXMgd2VsbCwgc28g
dGhhdCB3ZSBjYW4gYmUKPiBzdXJlIF9fdmEgaW4gX19zdGFydF94ZW4gd29ya3MuCj4gCj4gU2ln
bmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KClJldmlld2VkLWJ5OiBS
b2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KCldpdGggb25lIHF1ZXN0aW9u
IGJlbG93LgoKPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2Jvb3QvaGVhZC5TIGIveGVuL2Fy
Y2gveDg2L2Jvb3QvaGVhZC5TCj4gaW5kZXggMGY2NTJjZWExMS4uYWEyZTJhOTNjOCAxMDA2NDQK
PiAtLS0gYS94ZW4vYXJjaC94ODYvYm9vdC9oZWFkLlMKPiArKysgYi94ZW4vYXJjaC94ODYvYm9v
dC9oZWFkLlMKPiBAQCAtNDE0LDYgKzQxNCw3IEBAIF9fcHZoX3N0YXJ0Ogo+ICAKPiAgICAgICAg
ICAvKiBTZXQgdHJhbXBvbGluZV9waHlzIHRvIHVzZSBtZm4gMSB0byBhdm9pZCBoYXZpbmcgYSBt
YXBwaW5nIGF0IFZBIDAgKi8KPiAgICAgICAgICBtb3Z3ICAgICQweDEwMDAsIHN5bV9lc2kodHJh
bXBvbGluZV9waHlzKQo+ICsgICAgICAgIG1vdmwgICAgKCVlYngpLCAlZWF4IC8qIG1vdiAkWEVO
X0hWTV9TVEFSVF9NQUdJQ19WQUxVRSwgJWVheCAqLwoKRG8geW91IHJlYWxseSBuZWVkIHRoZSBs
IHN1ZmZpeCBoZXJlPwoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
