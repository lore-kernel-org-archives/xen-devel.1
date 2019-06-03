From: Julien Grall <julien.grall@arm.com>
Subject: Re: [qemu-upstream-4.11-testing test] 137100:
 regressions - FAIL
Date: Mon, 3 Jun 2019 14:47:36 +0100
Message-ID: <86e15367-cecd-a351-62ba-c0fd672e5933@arm.com>
References: <osstest-137100-mainreport@xen.org>
 <5CF4E99E02000078002347D5@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fnY6=UC=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hXnJM-00037O-BP
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 13:47:40 +0000
In-Reply-To: <5CF4E99E02000078002347D5@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Anthony Perard <anthony.perard@citrix.com>, osstest service owner <osstest-admin@xenproject.org>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

SGkgSmFuLAoKT24gMDMvMDYvMjAxOSAxMDozNCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24g
MDEuMDYuMTkgYXQgMTA6NDMsIDxvc3N0ZXN0LWFkbWluQHhlbnByb2plY3Qub3JnPiB3cm90ZToK
Pj4gZmxpZ2h0IDEzNzEwMCBxZW11LXVwc3RyZWFtLTQuMTEtdGVzdGluZyByZWFsIFtyZWFsXQo+
PiBodHRwOi8vbG9ncy50ZXN0LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MvMTM3MTAw
Lwo+Pgo+PiBSZWdyZXNzaW9ucyA6LSgKPj4KPj4gVGVzdHMgd2hpY2ggZGlkIG5vdCBzdWNjZWVk
IGFuZCBhcmUgYmxvY2tpbmcsCj4+IGluY2x1ZGluZyB0ZXN0cyB3aGljaCBjb3VsZCBub3QgYmUg
cnVuOgo+PiAgIGJ1aWxkLWFybTY0LXB2b3BzICAgICAgICAgICAgICAgPGpvYiBzdGF0dXM+ICAg
ICAgICAgICAgICAgICBicm9rZW4gIGluIDEzNDUwNAo+PiAgIGJ1aWxkLWFybTY0LXhzbSAgICAg
ICAgICAgICAgICAgPGpvYiBzdGF0dXM+ICAgICAgICAgICAgICAgICBicm9rZW4gIGluIDEzNDUw
NAo+PiAgIGJ1aWxkLWFybTY0ICAgICAgICAgICAgICAgICAgICAgPGpvYiBzdGF0dXM+ICAgICAg
ICAgICAgICAgICBicm9rZW4gIGluIDEzNDUwNAo+PiAgIGJ1aWxkLWFybTY0LXhzbSAgICAgICAg
ICAgIDQgaG9zdC1pbnN0YWxsKDQpIGJyb2tlbiBpbiAxMzQ1MDQgUkVHUi4gdnMuIDEyNTU3NQo+
PiAgIGJ1aWxkLWFybTY0ICAgICAgICAgICAgICAgIDQgaG9zdC1pbnN0YWxsKDQpIGJyb2tlbiBp
biAxMzQ1MDQgUkVHUi4gdnMuIDEyNTU3NQo+PiAgIGJ1aWxkLWFybTY0LXB2b3BzICAgICAgICAg
IDQgaG9zdC1pbnN0YWxsKDQpIGJyb2tlbiBpbiAxMzQ1MDQgUkVHUi4gdnMuIDEyNTU3NQo+PiAg
IHRlc3QtYXJtNjQtYXJtNjQteGwgICAgICAgICAgIDcgeGVuLWJvb3QgICAgICAgICAgICAgICAg
IGZhaWwgUkVHUi4gdnMuIDEyNTU3NQo+PiAgIHRlc3QtYXJtNjQtYXJtNjQtbGlidmlydC14c20g
IDcgeGVuLWJvb3QgICAgICAgICAgICAgICAgIGZhaWwgUkVHUi4gdnMuIDEyNTU3NQo+PiAgIHRl
c3QtYXJtNjQtYXJtNjQteGwtY3JlZGl0MiAgIDcgeGVuLWJvb3QgICAgICAgICAgICAgICAgIGZh
aWwgUkVHUi4gdnMuIDEyNTU3NQo+PiAgIHRlc3QtYXJtNjQtYXJtNjQteGwteHNtICAgICAgIDcg
eGVuLWJvb3QgICAgICAgICAgICAgICAgIGZhaWwgUkVHUi4gdnMuIDEyNTU3NQo+IAo+IFdoYXQg
aXMgdGhlIHNpdHVhdGlvbiBoZXJlPyBXaGVuIGNhbiB3ZSBleHBlY3QgdG8gYmUgYWJsZSB0byBn
ZXQKPiA0LjExLjIgb3V0IHRoZSBkb29yPwoKSSBoYXZlbid0IHNlZW4gYW55b25lIHJlcGx5aW5n
IG15IGUtbWFpbCBbMV0gc2VudCAxNCBkYXlzIGFnby4KCkNoZWVycywKClsxXSBodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMTktMDUvbXNnMDE3
NzEuaHRtbAoKPiAKPiBKYW4KPiAKPiAKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
