From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 10/10] x86: Handle new asynchronous exit
 qualification
Date: Fri, 29 Jun 2018 09:22:51 -0600
Message-ID: <5B364ECB02000078001CF440@prv1-mh.provo.novell.com>
References: <1527686884-5917-1-git-send-email-luwei.kang@intel.com>
 <1527686884-5917-11-git-send-email-luwei.kang@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1527686884-5917-11-git-send-email-luwei.kang@intel.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Luwei Kang <luwei.kang@intel.com>
Cc: Tim Deegan <tim@xen.org>, Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel@lists.xen.org, Julien Grall <julien.grall@arm.com>, Jun Nakajima <jun.nakajima@intel.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDMwLjA1LjE4IGF0IDE1OjI4LCA8bHV3ZWkua2FuZ0BpbnRlbC5jb20+IHdyb3RlOgo+
IFVzaW5nIEVQVCB0byB0cmFuc2xhdGUgUFQgb3V0cHV0IGFkZHJlc3NlcyBpbnRyb2R1Y2VzIHRo
ZSBwb3NzaWJpbGl0eSBvZgo+IHRha2luZyBldmVudHMgb24gUFQgb3V0cHV0IHJlYWRzIGFuZCB3
cml0ZXMuIEV2ZW50IHBvc3NpYmlsaXRpZXMgaW5jbHVkZQo+IEVQVCB2aW9sYXRpb25zLCBFUFQg
bWlzY29uZmlndXJhdGlvbnMsIFBNTCBsb2ctZnVsbCBWTSBleGl0cywgYW5kIEFQSUMKPiBhY2Nl
c3MgVk0gZXhpdHMuCj4gRVBUIHZpb2xhdGlvbnM6Cj4gIGEuIEludGVsIFBUIGJ1ZmZlciBpcyBh
IE1NSU8gYWRkcmVzcyBpbiBndWVzdC4gQWN0dWFsbHksIGl0IGNhbiBiZSBhCj4gICAgIE1NSU8g
YWRkcmVzcyAoU0RNIDM1LjIuNi4xKSwgYnV0IGluIG9yZGVyIGRvIG5vdCBhZmZlY3Qgb3RoZXIK
PiAgICAgcGFzc3Rocm91Z2gvZW11bGF0ZSBkZXZpY2UgaW4gZ3Vlc3QuIEZlcmJpZCB1c2UgTU1J
TyBhZGRyIGF0IHByZXNlbnQuCj4gIGIuIEludGVsIFBUIGJ1ZmZlciBpcyBhIFJBTSBub24td3Jp
dGFibGUgYWRkcmVzcy4gRG9uJ3QgbmVlZCBlbXVsYXRlCj4gICAgIGFuZCBpbmplY3QgYSAjR1Ag
dG8gZ3Vlc3QuCgpJcyBzdWNoICNHUCBpbmplY3Rpb24gYXJjaGl0ZWN0dXJhbCBiZWhhdmlvcj8g
V2UndmUgZ290IGEgZmV3IGJhZApleGFtcGxlcyB3aGVyZSB3ZSBpbmplY3QgZXhjZXB0aW9ucyB3
aGljaCBhcmUgYXJjaGl0ZWN0dXJhbGx5CmltcG9zc2libGUgLSBsZXQncyBwbGVhc2Ugbm90IGFk
ZCBhbnkgZnVydGhlciBpbnN0YW5jZXMuCgo+IEBAIC00MDI3LDYgKzQwMjgsMTAgQEAgdm9pZCB2
bXhfdm1leGl0X2hhbmRsZXIoc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MpCj4gICAgICAgICAg
YnJlYWs7Cj4gIAo+ICAgICAgY2FzZSBFWElUX1JFQVNPTl9BUElDX0FDQ0VTUzoKPiArICAgICAg
ICBfX3ZtcmVhZChFWElUX1FVQUxJRklDQVRJT04sICZleGl0X3F1YWxpZmljYXRpb24pOwo+ICsg
ICAgICAgIGlmICggZXhpdF9xdWFsaWZpY2F0aW9uICYgMHgxMDAwMCApCgpQbGVhc2Ugbm8gdXNl
IG9mIGxpdGVyYWwgbnVtYmVycyBsaWtlIHRoaXMuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
