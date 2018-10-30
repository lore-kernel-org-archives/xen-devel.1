From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 7/7] amd/pvh: enable ACPI C1E disable
 quirk on PVH Dom0
Date: Tue, 30 Oct 2018 05:38:37 -0600
Message-ID: <5BD842BD02000078001F647C@prv1-mh.provo.novell.com>
References: <20181019152021.64607-1-roger.pau@citrix.com>
 <20181019152021.64607-8-roger.pau@citrix.com>
 <5BD716E802000078001F5D60@prv1-mh.provo.novell.com>
 <20181030110054.7hhwpqqdlxq2cnau@mac.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=kgbc=nk=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gHSM8-0006la-Bx
 for xen-devel@lists.xenproject.org; Tue, 30 Oct 2018 11:38:44 +0000
In-Reply-To: <20181030110054.7hhwpqqdlxq2cnau@mac.citrite.net>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Brian Woods <brian.woods@amd.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDMwLjEwLjE4IGF0IDEyOjAwLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIE1vbiwgT2N0IDI5LCAyMDE4IGF0IDA4OjE5OjIwQU0gLTA2MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiA+Pj4gT24gMTkuMTAuMTggYXQgMTc6MjAsIDxyb2dlci5wYXVAY2l0cml4LmNvbT4g
d3JvdGU6Cj4+ID4gLS0tIGEveGVuL2FyY2gveDg2L2h2bS9zdm0vc3ZtLmMKPj4gPiArKysgYi94
ZW4vYXJjaC94ODYvaHZtL3N2bS9zdm0uYwo+PiA+IEBAIC0xMjcyLDYgKzEyNzIsMjQgQEAgdm9p
ZCBzdm1faG9zdF9vc3Z3X2luaXQoKQo+PiA+ICAgICAgc3Bpbl91bmxvY2soJm9zdndfbG9jayk7
Cj4+ID4gIH0KPj4gPiAgCj4+ID4gK3N0YXRpYyBpbnQgYWNwaV9jMWVfcXVpcmsoaW50IGRpciwg
dW5zaWduZWQgaW50IHBvcnQsIHVuc2lnbmVkIGludCBieXRlcywKPj4gPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICB1aW50MzJfdCAqdmFsKQo+PiA+ICt7Cj4+ID4gKyAgICBBU1NFUlQoYnl0
ZXMgPT0gMSAmJiBwb3J0ID09IGFjcGlfc21pX2NtZCk7Cj4+ID4gKwo+PiA+ICsgICAgaWYgKCBk
aXIgPT0gSU9SRVFfUkVBRCApCj4+ID4gKyAgICB7Cj4+ID4gKyAgICAgICAgKnZhbCA9IGluYihw
b3J0KTsKPj4gPiArICAgICAgICByZXR1cm4gWDg2RU1VTF9PS0FZOwo+PiA+ICsgICAgfQo+PiA+
ICsKPj4gPiArICAgIG91dGIoKnZhbCwgcG9ydCk7Cj4+ID4gKyAgICBpZiAoICp2YWwgPT0gYWNw
aV9lbmFibGVfdmFsdWUgKQo+PiA+ICsgICAgICAgb25fZWFjaF9jcHUoYW1kX2Rpc2FibGVfYzFl
LCBOVUxMLCAxKTsKPj4gPiArCj4+ID4gKyAgICByZXR1cm4gWDg2RU1VTF9PS0FZOwo+PiA+ICt9
Cj4+IAo+PiBOb3RoaW5nIGluIGhlcmUgbm9yIC4uLgo+PiAKPj4gPiBAQCAtMTI4NCw2ICsxMzAy
LDkgQEAgc3RhdGljIGludCBzdm1fZG9tYWluX2luaXRpYWxpc2Uoc3RydWN0IGRvbWFpbiAqZCkK
Pj4gPiAgCj4+ID4gICAgICBzdm1fZ3Vlc3Rfb3N2d19pbml0KGQpOwo+PiA+ICAKPj4gPiArICAg
IGlmICggYW1kX2FjcGlfYzFlX3F1aXJrICkKPj4gPiArICAgICAgICByZWdpc3Rlcl9wb3J0aW9f
aGFuZGxlcihkLCBhY3BpX3NtaV9jbWQsIDEsIGFjcGlfYzFlX3F1aXJrKTsKPj4gCj4+IC4uLiB0
aGUgcmVnaXN0cmF0aW9uIGhlcmUgcmVzdHJpY3RzIHRoaXMgdG8gRG9tMC4KPiAKPiBSaWdodCwg
SSBnb3QgbWVzc2VkIHVwIHdpdGggdGhlIHBlcm1pc3Npb25zIGFuZCBjb21wbGV0ZWx5IGZvcmdv
dAo+IGFib3V0IGxpbWl0aW5nIHRvIERvbTAuCj4gCj4gVGhlIGFib3ZlIG5lZWRzIHRvIGhhdmUg
YSAnJiYgaXNfaGFyZHdhcmVfZG9tYWluKGQpJyBJTU8uIEkgcHJlZmVyIHRvCj4gZG8gdGhpcyBh
dCBob29rIHJlZ2lzdHJhdGlvbiByYXRoZXIgdGhhbiBhZGRpbmcgc3VjaCBjaGVjayBpbiB0aGUK
PiBoYW5kbGVyIGl0c2VsZi4KCk9mIGNvdXJzZS4gTm8gcG9pbnQgdG8gcmVnaXN0ZXIgYSBoYW5k
bGVyIHRoYXQgZG9lcyBub3RoaW5nLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
