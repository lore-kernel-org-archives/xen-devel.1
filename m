From: "Jan Beulich" <JBeulich@suse.com>
Subject: Ping: [PATCH 2/2] x86/HVM: attempts to emulate FPU
 insns need to set fpu_initialised
Date: Fri, 22 Jun 2018 04:52:44 -0600
Message-ID: <5B2CD4FC02000078001CCEEC@prv1-mh.provo.novell.com>
References: <5B237D0B02000078001CB837@prv1-mh.provo.novell.com>
 <5B237FC302000078001CB84E@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=xfht=ji=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fWJgQ-0005wQ-UW
 for xen-devel@lists.xenproject.org; Fri, 22 Jun 2018 10:52:50 +0000
In-Reply-To: <5B237FC302000078001CB84E@prv1-mh.provo.novell.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE1LjA2LjE4IGF0IDEwOjU4LCA8SkJldWxpY2hAc3VzZS5jb20+IHdyb3RlOgo+IE15
IG9yaWdpbmFsIHdheSBvZiB0aGlua2luZyBoZXJlIHdhcyB0aGF0IHRoaXMgd291bGQgYmUgc2V0
IGFueXdheSBhdAo+IHRoZSBwb2ludCBzdGF0ZSBnZXRzIHJlbG9hZGVkIGFmdGVyIHRoZSBhZGp1
c3RtZW50cyBodm1lbXVsX3B1dF9mcHUoKQo+IGRvZXMsIGJ1dCB0aGUgZmxhZyBzaG91bGQgYWxy
ZWFkeSBiZSBzZXQgYmVmb3JlIHRoYXQgLSBhZnRlciBhbGwgdGhlCj4gZ3Vlc3QgbWF5IG5ldmVy
IGFnYWluIHRvdWNoIHRoZSBGUFUgYmVmb3JlIGUuZy4gZ2V0dGluZyBtaWdyYXRlZC9zYXZlZC4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gCj4g
LS0tIGEveGVuL2FyY2gveDg2L2h2bS9lbXVsYXRlLmMKPiArKysgYi94ZW4vYXJjaC94ODYvaHZt
L2VtdWxhdGUuYwo+IEBAIC0yMDUzLDYgKzIwNTMsNyBAQCBzdGF0aWMgaW50IGh2bWVtdWxfZ2V0
X2ZwdSgKPiAgICAgICAgICAgKiBtYXNraW5nIG9mIGFsbCBleGNlcHRpb25zIGJ5IEZOU1RFTlYu
KQo+ICAgICAgICAgICAqLwo+ICAgICAgICAgIHNhdmVfZnB1X2VuYWJsZSgpOwo+ICsgICAgICAg
IGN1cnItPmZwdV9pbml0aWFsaXNlZCA9IHRydWU7Cj4gICAgICAgICAgY3Vyci0+ZnB1X2RpcnRp
ZWQgPSB0cnVlOwo+ICAgICAgICAgIGlmICggKGZwdV9jdHh0LT5mY3cgJiAweDNmKSAhPSAweDNm
ICkKPiAgICAgICAgICB7CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
