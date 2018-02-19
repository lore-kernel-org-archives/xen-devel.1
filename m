From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v4 3/4] x86: fix indirect thunk usage of
 CONFIG_INDIRECT_THUNK
Date: Mon, 19 Feb 2018 09:09:32 -0700
Message-ID: <5A8B04CC02000078001A935D@prv-mh.provo.novell.com>
References: <20180219141620.20008-1-roger.pau@citrix.com>
 <20180219141620.20008-4-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=udnn=fn=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1eno0Y-0002wY-Dn
 for xen-devel@lists.xenproject.org; Mon, 19 Feb 2018 16:09:38 +0000
In-Reply-To: <20180219141620.20008-4-roger.pau@citrix.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE5LjAyLjE4IGF0IDE1OjE2LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IFdoZW4gaW5kaXJlY3RfdGh1bmtfYXNtLmggaXMgaW5zdGFudGlhdGVkIGRpcmVjdGx5IGludG8g
YXNzZW1ibHkgZmlsZXMKPiBDT05GSUdfSU5ESVJFQ1RfVEhVTksgbWlnaHQgbm90IGJlIGRlZmlu
ZWQsIGFuZCB0aHVzIHVzaW5nIC5pZiBhZ2FpbnN0Cj4gaXQgaXMgd3JvbmcuCj4gCj4gQWRkIGEg
Y2hlY2sgdG8gZGVmaW5lIENPTkZJR19JTkRJUkVDVF9USFVOSyB0byAwIGlmIG5vdCBkZWZpbmVk
LCBzbwo+IHRoYXQgdXNpbmcgLmlmIENPTkZJR19JTkRJUkVDVF9USFVOSyBpcyBhbHdheXMgY29y
cmVjdC4KPiAKPiBUaGlzIHN1cHByZXNzZXMgdGhlIGZvbGxvd2luZyBjbGFuZyBlcnJvcjoKPiAK
PiA8aW5zdGFudGlhdGlvbj46ODo5OiBlcnJvcjogZXhwZWN0ZWQgYWJzb2x1dGUgZXhwcmVzc2lv
bgo+ICAgICAuaWYgQ09ORklHX0lORElSRUNUX1RIVU5LID09IDEKPiAgICAgICAgIF4KPiA8aW5z
dGFudGlhdGlvbj46MToxOiBub3RlOiB3aGlsZSBpbiBtYWNybyBpbnN0YW50aWF0aW9uCj4gSU5E
SVJFQ1RfQlJBTkNIIGNhbGwgJXJkeAo+IF4KPiBlbnRyeS5TOjU4OTo5OiBub3RlOiB3aGlsZSBp
biBtYWNybyBpbnN0YW50aWF0aW9uCj4gICAgICAgICBJTkRJUkVDVF9DQUxMICVyZHgKPiAgICAg
ICAgIF4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0
cml4LmNvbT4KCkFzIHNhaWQgcHJldmlvdXNseSBJJ20gbm90IG92ZXJseSBoYXBweSBhYm91dCB0
aGlzLCBidXQgc3RpbGwKQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4K
CkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
