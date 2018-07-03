From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 2/2] xen/xsm: Add new SILO mode for XSM
Date: Tue, 03 Jul 2018 04:15:44 -0600
Message-ID: <5B3B4CD002000078001D0236@prv1-mh.provo.novell.com>
References: <20180703012629.507-1-xin.li@citrix.com>
 <20180703012629.507-2-xin.li@citrix.com>
 <5B3B26E202000078001D0114@prv1-mh.provo.novell.com>
 <c3a55c41f7f94d4a955870f7813b3812@SINPEX02CL01.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <c3a55c41f7f94d4a955870f7813b3812@SINPEX02CL01.citrite.net>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xin Li <xin.li@citrix.com>, Xin Li <talons.lee@gmail.com>
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, george.dunlap@citrix.com, xen-devel@lists.xen.org, Ming Lu <ming.lu@citrix.com>, Daniel de Graaf <dgdegra@tycho.nsa.gov>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAzLjA3LjE4IGF0IDExOjA3LCA8eGluLmxpQGNpdHJpeC5jb20+IHdyb3RlOgo+PiBG
cm9tOiBKYW4gQmV1bGljaCBbbWFpbHRvOkpCZXVsaWNoQHN1c2UuY29tXQo+PiBTZW50OiBUdWVz
ZGF5LCBKdWx5IDMsIDIwMTggMzozNCBQTQo+PiA+Pj4gT24gMDMuMDcuMTggYXQgMDM6MjYsIDx0
YWxvbnMubGVlQGdtYWlsLmNvbT4gd3JvdGU6Cj4+ID4gKyAgICByZXR1cm4gKGlzX2NvbnRyb2xf
ZG9tYWluKGN1cl9kb20pIHx8IGlzX2NvbnRyb2xfZG9tYWluKGxkb20pIHx8Cj4+ID4gKyAgICAg
ICAgICAgIGlzX2NvbnRyb2xfZG9tYWluKHJkb20pIHx8IGxkb20gPT0gcmRvbSk7IH0KPj4gPiAr
Cj4+ID4gK3N0YXRpYyBpbnQgc2lsb19ldnRjaG5fdW5ib3VuZChzdHJ1Y3QgZG9tYWluICpkMSwg
c3RydWN0IGV2dGNobiAqY2huLAo+PiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ZG9taWRfdCBpZDIpIHsKPj4gPiArICAgIGludCByYyA9IC1FUEVSTTsKPj4gPiArICAgIHN0cnVj
dCBkb21haW4gKmQyID0gcmN1X2xvY2tfZG9tYWluX2J5X2lkKGlkMik7Cj4+ID4gKyAgICBpZiAo
IGQyICE9IE5VTEwgJiYgc2lsb19tb2RlX2RvbV9jaGVjayhkMSwgZDIpICkKPj4gCj4+IEJsYW5r
IGxpbmUgcGxlYXNlIGJldHdlZW4gZGVjbGFyYXRpb24ocykgYW5kIHN0YXRlbWVudChzKS4gQW5k
IGNvbnN0IG9uIHRoZQo+PiBsb2NhbCB2YXJpYWJsZSBkZWNsYXJhdGlvbiBhZ2Fpbi4KPj4gCj4+
IEFsc28sIGlzIERPTUlEX1NFTEYgcmVhbGx5IG5vdCBhbGxvd2VkIGhlcmUgZm9yIGlkMj8gSSBk
b24ndCB0aGluayBzbywgbG9va2luZyBhdAo+PiBlLmcuIGV2dGNobl9hbGxvY191bmJvdW5kKCku
Cj4gCj4gc3RhdGljIGludCBzaWxvX2V2dGNobl91bmJvdW5kKHN0cnVjdCBkb21haW4gKmQxLCBz
dHJ1Y3QgZXZ0Y2huICpjaG4sCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRvbWlk
X3QgaWQyKQo+IHsgICAKPiAgICAgaW50IHJjID0gLUVQRVJNOwo+ICAgICBzdHJ1Y3QgZG9tYWlu
ICpkMjsKPiAgICAgCj4gICAgIGlmICggaWQyID09IERPTUlEX1NFTEYgKQo+ICAgICAgICAgaWQy
ID0gY3VycmVudC0+ZG9tYWluLT5kb21haW5faWQ7Cj4gICAgIGQyID0gcmN1X2xvY2tfZG9tYWlu
X2J5X2lkKGlkMik7CgpObyAtIHNpbXBseSBjYWxsIHJjdV9sb2NrX2RvbWFpbl9ieV9hbnlfaWQo
KS4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
