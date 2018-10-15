From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2] xen/blkfront: avoid NULL blkfront_info
 dereference on device removal
Date: Mon, 15 Oct 2018 16:02:01 +0200
Message-ID: <20181015140201.elir7ettk7sz4aix__15704.247999429$1539612111$gmane$org@mac.bytemobile.com>
References: <20181015132508.23293-1-vliaskovitis@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=06k+=m3=citrix.com=prvs=8197794ea=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gC3Si-0001xp-As
 for xen-devel@lists.xenproject.org; Mon, 15 Oct 2018 14:03:12 +0000
Content-Disposition: inline
In-Reply-To: <20181015132508.23293-1-vliaskovitis@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Vasilis Liaskovitis <vliaskovitis@suse.com>
Cc: jgross@suse.com, axboe@kernel.dk, konrad.wilk@oracle.com, linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBPY3QgMTUsIDIwMTggYXQgMDM6MjU6MDhQTSArMDIwMCwgVmFzaWxpcyBMaWFza292
aXRpcyB3cm90ZToKPiBJZiBhIGJsb2NrIGRldmljZSBpcyBob3QtYWRkZWQgd2hlbiB3ZSBhcmUg
b3V0IG9mIGdyYW50cywKPiBnbnR0YWJfZ3JhbnRfZm9yZWlnbl9hY2Nlc3MgZmFpbHMgd2l0aCAt
RU5PU1BDIChsb2cgbWVzc2FnZSAiMjgKPiBncmFudGluZyBhY2Nlc3MgdG8gcmluZyBwYWdlIikg
aW4gdGhpcyBjb2RlIHBhdGg6Cj4gCj4gICB0YWxrX3RvX2Jsa2JhY2sgLT4KPiAJc2V0dXBfYmxr
cmluZyAtPgo+IAkJeGVuYnVzX2dyYW50X3JpbmcgLT4KPiAJCQlnbnR0YWJfZ3JhbnRfZm9yZWln
bl9hY2Nlc3MKPiAKPiBhbmQgdGhlIGZhaWxpbmcgcGF0aCBpbiB0YWxrX3RvX2Jsa2JhY2sgc2V0
cyB0aGUgZHJpdmVyX2RhdGEgdG8gTlVMTDoKPiAKPiAgZGVzdHJveV9ibGtyaW5nOgo+ICAgICAg
ICAgYmxraWZfZnJlZShpbmZvLCAwKTsKPiAKPiAgICAgICAgIG11dGV4X2xvY2soJmJsa2Zyb250
X211dGV4KTsKPiAgICAgICAgIGZyZWVfaW5mbyhpbmZvKTsKPiAgICAgICAgIG11dGV4X3VubG9j
aygmYmxrZnJvbnRfbXV0ZXgpOwo+IAo+ICAgICAgICAgZGV2X3NldF9kcnZkYXRhKCZkZXYtPmRl
diwgTlVMTCk7Cj4gCj4gVGhpcyByZXN1bHRzIGluIGEgTlVMTCBwb2ludGVyIEJVRyB3aGVuIGJs
a2Zyb250X3JlbW92ZSBhbmQgYmxraWZfZnJlZQo+IHRyeSB0byBhY2Nlc3MgdGhlIGZhaWxpbmcg
ZGV2aWNlJ3MgTlVMTCBzdHJ1Y3QgYmxrZnJvbnRfaW5mby4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBW
YXNpbGlzIExpYXNrb3ZpdGlzIDx2bGlhc2tvdml0aXNAc3VzZS5jb20+CgpSZXZpZXdlZC1ieTog
Um9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CgpUaGFua3MuCgpJIGd1ZXNz
IHRoaXMgaXMgYSBjYW5kaWRhdGUgZm9yIGJhY2twb3J0aW5nPwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
