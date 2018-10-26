From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 2/5] x86/domain: Initialise vcpu debug
 registers correctly
Date: Fri, 26 Oct 2018 07:31:00 -0600
Message-ID: <5BD3171402000078001F531D@prv1-mh.provo.novell.com>
References: <1539599780-14549-1-git-send-email-andrew.cooper3@citrix.com>
 <1539599780-14549-3-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1539599780-14549-3-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Xen-devel <xen-devel@lists.xen.org>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE1LjEwLjE4IGF0IDEyOjM2LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gLS0tIGEveGVuL2FyY2gveDg2L2RvbWFpbi5jCj4gKysrIGIveGVuL2FyY2gveDg2L2Rv
bWFpbi5jCj4gQEAgLTMyMyw2ICszMjMsMTggQEAgdm9pZCBmcmVlX3ZjcHVfc3RydWN0KHN0cnVj
dCB2Y3B1ICp2KQo+ICAgICAgZnJlZV94ZW5oZWFwX3BhZ2Uodik7Cj4gIH0KPiAgCj4gKy8qIElu
aXRpYWxpc2UgdmFyaW91cyByZWdpc3RlcnMgdG8gdGhlaXIgYXJjaGl0ZWN0dXJhbCBJTklUL1JF
U0VUIHN0YXRlLiAqLwo+ICt2b2lkIGFyY2hfdmNwdV9yZWdzX2luaXQoc3RydWN0IHZjcHUgKnYp
Cj4gK3sKPiArICAgIHYtPmFyY2gudXNlcl9yZWdzID0gKHR5cGVvZih2LT5hcmNoLnVzZXJfcmVn
cykpewo+ICsgICAgICAgIC5yZmxhZ3MgPSBYODZfRUZMQUdTX01CUywKPiArICAgIH07CgpTYWRs
eSB0aGlzIGluaXRpYWxpemVyIGJyb2tlIHRoZSBidWlsZCBvbmNlIGFnYWluIGZvciBnY2MgNC4z
LnguCihBcyBhIHNpZGUgbm90ZSwgdXNpbmcgLmVmbGFncyBpbnN0ZWFkIG9mIC5yZmxhZ3Mgd291
bGQgaGF2ZSBhCmZhaXIgY2hhbmNlIG9mIGFuIG9taXR0ZWQgUkVYIHByZWZpeC4pCgpKYW4KCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
