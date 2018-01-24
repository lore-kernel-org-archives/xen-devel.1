From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 2/2] x86: fix indirect thunk usage of
 CONFIG_INDIRECT_THUNK
Date: Wed, 24 Jan 2018 09:23:37 -0700
Message-ID: <5A68C11902000078001A20EE@prv-mh.provo.novell.com>
References: <20180124154849.84889-1-roger.pau@citrix.com>
 <20180124154849.84889-3-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=5p9l=et=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1eeNpu-000456-Vu
 for xen-devel@lists.xenproject.org; Wed, 24 Jan 2018 16:23:43 +0000
In-Reply-To: <20180124154849.84889-3-roger.pau@citrix.com>
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

Pj4+IE9uIDI0LjAxLjE4IGF0IDE2OjQ4LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
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
ICAgIF4KCldoeSBpcyB0aGUgc2FtZSBubyBwcm9ibGVtIHdpdGggZ2FzPyBJdCB3YW50cyBjb25z
dGFudApleHByZXNzaW9ucyB3aXRoIC5pZiB0b28sIGFmdGVyIGFsbC4KCkphbgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
