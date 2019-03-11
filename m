From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH 2/6] x86: save GUEST_BNDCFGS on context
 switch...
Date: Mon, 11 Mar 2019 17:34:30 +0000
Message-ID: <48709a1b29244ec2b40fc5b659933031@AMSPEX02CL02.citrite.net>
References: <20190107120258.17897-1-paul.durrant@citrix.com>
 <20190107120258.17897-3-paul.durrant@citrix.com>
 <5C829B7F020000780021CC36@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TKYa=RO=citrix.com=prvs=96668afeb=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1h3Oor-00064K-8B
 for xen-devel@lists.xenproject.org; Mon, 11 Mar 2019 17:34:33 +0000
In-Reply-To: <5C829B7F020000780021CC36@prv1-mh.provo.novell.com>
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
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEphbiBCZXVsaWNoIFttYWlsdG86
SkJldWxpY2hAc3VzZS5jb21dCj4gU2VudDogMDggTWFyY2ggMjAxOSAxNjo0Mwo+IFRvOiBQYXVs
IER1cnJhbnQgPFBhdWwuRHVycmFudEBjaXRyaXguY29tPgo+IENjOiBBbmRyZXcgQ29vcGVyIDxB
bmRyZXcuQ29vcGVyM0BjaXRyaXguY29tPjsgUm9nZXIgUGF1IE1vbm5lIDxyb2dlci5wYXVAY2l0
cml4LmNvbT47IFdlaSBMaXUKPiA8d2VpLmxpdTJAY2l0cml4LmNvbT47IEp1biBOYWthamltYSA8
anVuLm5ha2FqaW1hQGludGVsLmNvbT47IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29t
PjsgeGVuLQo+IGRldmVsIDx4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc+Cj4gU3ViamVj
dDogUmU6IFtQQVRDSCAyLzZdIHg4Njogc2F2ZSBHVUVTVF9CTkRDRkdTIG9uIGNvbnRleHQgc3dp
dGNoLi4uCj4gCj4gPj4+IE9uIDA3LjAxLjE5IGF0IDEzOjAyLCA8cGF1bC5kdXJyYW50QGNpdHJp
eC5jb20+IHdyb3RlOgo+ID4gLi4udG8gYXZvaWQgdGhlIG5lZWQgZm9yIGEgVk1DUyByZWxvYWQg
d2hlbiB0aGUgdmFsdWUgb2YgTVNSX0lBMzJfQk5EQ0ZHUyBpcwo+ID4gcmVhZCBieSB0aGUgdG9v
bC1zdGFjay4KPiAKPiBJcyB0aGlzIGEgZ29vZCB0cmFkZS1vZmY/IEkuZS4gYXJlIHRvb2wgc3Rh
Y2sgcmVhZHMgYXQgbGVhc3QgYXMgZnJlcXVlbnQgYXMKPiBjb250ZXh0IHN3aXRjaGVzPwo+IAoK
SW4gdGhlIGFic2VuY2Ugb2YgYW55IGNvbW1lbnQgZnJvbSBBbmRyZXcgb24gcmVsYXRpdmUgY29z
dCwgSSdsbCBkcm9wIHRoaXMuCgo+IEphbgo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
