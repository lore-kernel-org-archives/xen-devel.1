From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86/spec_ctrl: Fix determination of when to
 use IBRS
Date: Tue, 06 Feb 2018 09:12:14 -0700
Message-ID: <5A79E1EE02000078001A5BDA@prv-mh.provo.novell.com>
References: <1517924923-28568-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1517924923-28568-1-git-send-email-andrew.cooper3@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Zhenzhong Duan <zhenzhong.duan@oracle.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA2LjAyLjE4IGF0IDE0OjQ4LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gVGhlIG9yaWdpbmFsIHZlcnNpb24gb2YgdGhpcyBsb2dpYyB3YXM6Cj4gCj4gICAgIC8q
Cj4gICAgICAqIE9uIEludGVsIGhhcmR3YXJlLCB3ZSdkIGxpa2UgdG8gdXNlIHJldHBvbGluZSBp
biBwcmVmZXJlbmNlIHRvCj4gICAgICAqIElCUlMsIGJ1dCBvbmx5IGlmIGl0IGlzIHNhZmUgb24g
dGhpcyBoYXJkd2FyZS4KPiAgICAgICovCj4gICAgIGVsc2UgaWYgKCBib290X2NwdV9oYXMoWDg2
X0ZFQVRVUkVfSUJSU0IpICkKPiAgICAgewo+ICAgICAgICAgaWYgKCByZXRwb2xpbmVfc2FmZSgp
ICkKPiAgICAgICAgICAgICB0aHVuayA9IFRIVU5LX1JFVFBPTElORTsKPiAgICAgICAgIGVsc2UK
PiAgICAgICAgICAgICBpYnJzID0gdHJ1ZTsKPiAgICAgfQo+IAo+IGJ1dCBpdCB3YXMgY2hhbmdl
ZCBieSBhIHJlcXVlc3QgZHVyaW5nIHJldmlldy4gIFNhZGx5LCB0aGUgcmVzdWx0IGlzIGJ1Z2d5
IGFzCj4gaXQgYnJlYWtzIHRoZSBsYXRlciBmYWxsYmFjayBsb2dpYyBieSBhbGxvd2luZyBJQlJT
IHRvIGFwcGVhciBhcyBhdmFpbGFibGUKPiB3aGVuIGluIGZhY3QgaXQgaXNuJ3QuCj4gCj4gVGhp
cyBpbiBwcmFjdGljZSBtZWFucyB0aGF0IG9uIHJlcG9saW5lLXVuc2FmZSBoYXJkd2FyZSB3aXRo
b3V0IElCUlMsIHdlCj4gc2VsZWN0IFRIVU5LX0pVTVAgZGVzcGl0ZSBpbnRlbmRpbmcgdG8gc2Vs
ZWN0IFRIVU5LX1JFVFBPTElORS4KPiAKPiBSZXBvcnRlZC1ieTogWmhlbnpob25nIER1YW4gPHpo
ZW56aG9uZy5kdWFuQG9yYWNsZS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8
YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KClJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
