From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [linux-3.18 bisection] complete
 test-amd64-amd64-xl-shadow
Date: Fri, 24 Aug 2018 09:35:52 +0000
Message-ID: <867af023836249878d96196f9e1e27be@AMSPEX02CL03.citrite.net>
References: <E1ft0R1-0000Ei-7L@osstest.test-lab.xenproject.org>
 <20180824091314.dwcnmwfjctdre2pw@citrix.com>
 <b27568f003fb447a8526a038d5d23a80@AMSPEX02CL03.citrite.net>
 <20180824093458.yqpjn2bidhkyifo2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=xfq4=lh=citrix.com=prvs=767642893=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1ft8VW-0002mn-W8
 for xen-devel@lists.xenproject.org; Fri, 24 Aug 2018 09:35:55 +0000
In-Reply-To: <20180824093458.yqpjn2bidhkyifo2@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, osstest service owner <osstest-admin@xenproject.org>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IFdlaSBMaXUgW21haWx0bzp3ZWku
bGl1MkBjaXRyaXguY29tXQo+IFNlbnQ6IDI0IEF1Z3VzdCAyMDE4IDEwOjM1Cj4gVG86IFBhdWwg
RHVycmFudCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+Cj4gQ2M6IFdlaSBMaXUgPHdlaS5saXUy
QGNpdHJpeC5jb20+OyBvc3N0ZXN0IHNlcnZpY2Ugb3duZXIgPG9zc3Rlc3QtCj4gYWRtaW5AeGVu
cHJvamVjdC5vcmc+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKPiBTdWJqZWN0OiBS
ZTogW1hlbi1kZXZlbF0gW2xpbnV4LTMuMTggYmlzZWN0aW9uXSBjb21wbGV0ZSB0ZXN0LWFtZDY0
LWFtZDY0LQo+IHhsLXNoYWRvdwo+IAo+IE9uIEZyaSwgQXVnIDI0LCAyMDE4IGF0IDEwOjMwOjI2
QU0gKzAxMDAsIFBhdWwgRHVycmFudCB3cm90ZToKPiA+ID4gPiBGb3IgYmlzZWN0aW9uIHJldmlz
aW9uLXR1cGxlIGdyYXBoIHNlZToKPiA+ID4gPiAgICBodHRwOi8vbG9ncy50ZXN0LWxhYi54ZW5w
cm9qZWN0Lm9yZy9vc3N0ZXN0L3Jlc3VsdHMvYmlzZWN0L2xpbnV4LQo+ID4gPiAzLjE4L3Rlc3Qt
YW1kNjQtYW1kNjQteGwtc2hhZG93Lmd1ZXN0LXN0YXJ0Lmh0bWwKPiA+ID4gPiBSZXZpc2lvbiBJ
RHMgaW4gZWFjaCBncmFwaCBub2RlIHJlZmVyLCByZXNwZWN0aXZlbHksIHRvIHRoZSBUcmVlcyBh
Ym92ZS4KPiA+ID4KPiA+ID4gZG9tYWluYnVpbGRlcjogZGV0YWlsOiB2Y3B1X3g4Nl82NDogY2Fs
bGVkCj4gPiA+IGRvbWFpbmJ1aWxkZXI6IGRldGFpbDogdmNwdV94ODZfNjQ6IGNyMzogcGZuIDB4
MjI0NSBtZm4gMHgyNDQ4NDUKPiA+ID4geGVuZm9yZWlnbm1lbW9yeTogZXJyb3I6IGlvY3RsIGZh
aWxlZDogSW52YWxpZCBhcmd1bWVudAo+ID4gPiB4YzogZXJyb3I6IHBhbmljOiB4Y19kb21fYm9v
dC5jOjQyMDogeGNfZG9tX2dudHRhYl9zZWVkOiBmYWlsZWQgdG8KPiBhY3F1aXJlCj4gPiA+IGQx
IGdyYW50IHRhYmxlIFtlcnJubz0yMl0KPiA+ID4gOiBJbnRlcm5hbCBlcnJvcgo+ID4gPiBsaWJ4
bDogZXJyb3I6IGxpYnhsX2RvbS5jOjc1MDpsaWJ4bF9fYnVpbGRfZG9tOiB4Y19kb21fZ250dGFi
X2luaXQgZmFpbGVkOgo+ID4gPiBJbnZhbGlkIGFyZ3VtZW50Cj4gPiA+IGRvbWFpbmJ1aWxkZXI6
IGRldGFpbDogeGNfZG9tX3JlbGVhc2U6IGNhbGxlZAo+ID4gPgo+ID4KPiA+IFRha2luZyBhIGxv
b2sgbm93Li4uIEp1c3QgZm9yY2luZyBoYXAgb2ZmIGRvZXNuJ3QgZ2VuZXJhdGUgYW4gaW1tZWRp
YXRlCj4gcmVwcm8gc28gSSdsbCBoYXZlIHRvIGhhdmUgYSBjbG9zZXIgbG9vayBhdCB0aGUgZW52
aXJvbm1lbnQuCj4gCj4gTm90ZSB0aGUgTGludXggYnJhbmNoIGlzIDMuMTguIEknbSBub3Qgc3Vy
ZSBpZiB0aGF0IHJlYWxseSBtYXR0ZXJzLgo+IAoKSSB0aGluayB0aGF0J3MgdGhlIGd1ZXN0IHZl
cnNpb24sIHdoaWNoIHNob3VsZCBiZSBpcnJlbGV2YW50LiBUcnlpbmcgdG8gZmlndXJlIG91dCBm
cm9tIHRoZSBsb2dzIHdoYXQgZG9tMCBpcy4KCiAgUGF1bAoKPiBXZWkuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
