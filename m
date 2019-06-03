From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [qemu-upstream-4.11-testing test] 137100:
 regressions - FAIL
Date: Mon, 03 Jun 2019 03:34:22 -0600
Message-ID: <5CF4E99E02000078002347D5@prv1-mh.provo.novell.com>
References: <osstest-137100-mainreport@xen.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TYzS=UC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hXjMJ-0002ew-M3
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 09:34:27 +0000
In-Reply-To: <osstest-137100-mainreport@xen.org>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, Anthony Perard <anthony.perard@citrix.com>, osstest service owner <osstest-admin@xenproject.org>
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAxLjA2LjE5IGF0IDEwOjQzLCA8b3NzdGVzdC1hZG1pbkB4ZW5wcm9qZWN0Lm9yZz4g
d3JvdGU6Cj4gZmxpZ2h0IDEzNzEwMCBxZW11LXVwc3RyZWFtLTQuMTEtdGVzdGluZyByZWFsIFty
ZWFsXQo+IGh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnByb2plY3Qub3JnL29zc3Rlc3QvbG9ncy8x
MzcxMDAvIAo+IAo+IFJlZ3Jlc3Npb25zIDotKAo+IAo+IFRlc3RzIHdoaWNoIGRpZCBub3Qgc3Vj
Y2VlZCBhbmQgYXJlIGJsb2NraW5nLAo+IGluY2x1ZGluZyB0ZXN0cyB3aGljaCBjb3VsZCBub3Qg
YmUgcnVuOgo+ICBidWlsZC1hcm02NC1wdm9wcyAgICAgICAgICAgICAgIDxqb2Igc3RhdHVzPiAg
ICAgICAgICAgICAgICAgYnJva2VuICBpbiAxMzQ1MDQKPiAgYnVpbGQtYXJtNjQteHNtICAgICAg
ICAgICAgICAgICA8am9iIHN0YXR1cz4gICAgICAgICAgICAgICAgIGJyb2tlbiAgaW4gMTM0NTA0
Cj4gIGJ1aWxkLWFybTY0ICAgICAgICAgICAgICAgICAgICAgPGpvYiBzdGF0dXM+ICAgICAgICAg
ICAgICAgICBicm9rZW4gIGluIDEzNDUwNAo+ICBidWlsZC1hcm02NC14c20gICAgICAgICAgICA0
IGhvc3QtaW5zdGFsbCg0KSBicm9rZW4gaW4gMTM0NTA0IFJFR1IuIHZzLiAxMjU1NzUKPiAgYnVp
bGQtYXJtNjQgICAgICAgICAgICAgICAgNCBob3N0LWluc3RhbGwoNCkgYnJva2VuIGluIDEzNDUw
NCBSRUdSLiB2cy4gMTI1NTc1Cj4gIGJ1aWxkLWFybTY0LXB2b3BzICAgICAgICAgIDQgaG9zdC1p
bnN0YWxsKDQpIGJyb2tlbiBpbiAxMzQ1MDQgUkVHUi4gdnMuIDEyNTU3NQo+ICB0ZXN0LWFybTY0
LWFybTY0LXhsICAgICAgICAgICA3IHhlbi1ib290ICAgICAgICAgICAgICAgICBmYWlsIFJFR1Iu
IHZzLiAxMjU1NzUKPiAgdGVzdC1hcm02NC1hcm02NC1saWJ2aXJ0LXhzbSAgNyB4ZW4tYm9vdCAg
ICAgICAgICAgICAgICAgZmFpbCBSRUdSLiB2cy4gMTI1NTc1Cj4gIHRlc3QtYXJtNjQtYXJtNjQt
eGwtY3JlZGl0MiAgIDcgeGVuLWJvb3QgICAgICAgICAgICAgICAgIGZhaWwgUkVHUi4gdnMuIDEy
NTU3NQo+ICB0ZXN0LWFybTY0LWFybTY0LXhsLXhzbSAgICAgICA3IHhlbi1ib290ICAgICAgICAg
ICAgICAgICBmYWlsIFJFR1IuIHZzLiAxMjU1NzUKCldoYXQgaXMgdGhlIHNpdHVhdGlvbiBoZXJl
PyBXaGVuIGNhbiB3ZSBleHBlY3QgdG8gYmUgYWJsZSB0byBnZXQKNC4xMS4yIG91dCB0aGUgZG9v
cj8KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
