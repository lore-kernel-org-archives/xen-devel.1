From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86: fix comment on super page alignment
 requirement
Date: Mon, 24 Sep 2018 05:19:12 -0600
Message-ID: <5BA8C83002000078001EB168@prv1-mh.provo.novell.com>
References: <20180924103835.12705-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=wm3w=mg=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g4Otb-0006vL-4Z
 for xen-devel@lists.xenproject.org; Mon, 24 Sep 2018 11:19:19 +0000
In-Reply-To: <20180924103835.12705-1-wei.liu2@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI0LjA5LjE4IGF0IDEyOjM4LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
LS0tIGEveGVuL2FyY2gveDg2L3NldHVwLmMKPiArKysgYi94ZW4vYXJjaC94ODYvc2V0dXAuYwo+
IEBAIC05NDQsMTIgKzk0NCwxMyBAQCB2b2lkIF9faW5pdCBub3JldHVybiBfX3N0YXJ0X3hlbih1
bnNpZ25lZCBsb25nIG1iaV9wKQo+ICAKPiAgICAgIC8qCj4gICAgICAgKiBJdGVyYXRlIGJhY2t3
YXJkcyBvdmVyIGFsbCBzdXBlcnBhZ2UtYWxpZ25lZCBSQU0gcmVnaW9ucy4KPiAtICAgICAqIAo+
IC0gICAgICogV2UgcmVxdWlyZSBzdXBlcnBhZ2UgYWxpZ25tZW50IGJlY2F1c2UgdGhlIGJvb3Qg
YWxsb2NhdG9yIGlzIG5vdCB5ZXQKPiAtICAgICAqIGluaXRpYWxpc2VkLiBIZW5jZSB3ZSBjYW4g
b25seSBtYXAgc3VwZXJwYWdlcyBpbiB0aGUgYWRkcmVzcyByYW5nZQo+IC0gICAgICogMCB0byBC
T09UU1RSQVBfRElSRUNUTUFQX0VORCwgYXMgdGhpcyBpcyBndWFyYW50ZWVkIG5vdCB0byByZXF1
aXJlCj4gKyAgICAgKgo+ICsgICAgICogV2UgcmVxdWlyZSBzdXBlcnBhZ2UgYWxpZ25tZW50IGJl
Y2F1c2UgdGhlIGJvb3QgYWxsb2NhdG9yIGlzCj4gKyAgICAgKiBub3QgeWV0IGluaXRpYWxpc2Vk
LiBIZW5jZSB3ZSBjYW4gb25seSBtYXAgc3VwZXJwYWdlcyBpbiB0aGUKPiArICAgICAqIGFkZHJl
c3MgcmFuZ2UgQk9PVFNUUkFQX01BUF9CQVNFIHRvIChCT09UU1RSQVBfTUFQX0JBU0UgKwo+ICsg
ICAgICogQk9PVFNUUkFQX01BUF9MSU1JVCksIGFzIHRoaXMgaXMgZ3VhcmFudGVlZCBub3QgdG8g
cmVxdWlyZQoKVGhlIHVwcGVyIGJvdW5kIGlzIG5vdCBhIHN1bS4gQnV0IHRoZXJlJ3MgdGhlbiBh
bHNvIGFuIGFwcGFyZW50CmRpc2Nvbm5lY3Q6IEJPT1RTVFJBUF9NQVBfTElNSVQgIT0KKEFSUkFZ
X1NJWkUobDJfaWRlbnRtYXApIDw8IEwyX1BBR0VUQUJMRV9TSElGVCkgYWZhaWN0LCB5ZXQKdGhl
IGxhdHRlciBpcyB3aGF0IGlzIHVzZWQgZm9yIG1hcHBpbmcgKGFuZCB3aGF0IG1hdGNoZXMgdGhl
IHZhbHVlCm9mIEJPT1RTVFJBUF9ESVJFQ1RNQVBfRU5EIGluIDQuMC40KS4KCkFsc28sIHNpbmNl
IHlvdSdyZSB0b3VjaGluZyBhbG1vc3QgdGhlIGVudGlyZSBjb21tZW50IGFueXdheSwKd291bGQg
eW91IG1pbmQgbW92aW5nIGl0IGRvd24gdG8gd2hlcmUgaXQgYmVsb25ncyAoaW1tZWRpYXRlbHkK
YWhlYWQgb2YgdGhlIGZvcigpKT8gT3ZlciB0aW1lIG1vcmUgYW5kIG1vcmUgdGhpbmdzIGdvdCBw
bGFjZWQKYmV0d2VlbiB0aGUgdHdvLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
