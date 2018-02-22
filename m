From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v5 4/5] x86: fix indirect thunk usage of
 CONFIG_INDIRECT_THUNK
Date: Thu, 22 Feb 2018 07:42:20 -0700
Message-ID: <5A8EE4DC02000078001AA729@prv-mh.provo.novell.com>
References: <20180220141015.30714-1-roger.pau@citrix.com>
 <20180220141015.30714-5-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=x7kc=fq=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1eos4m-0007V5-FE
 for xen-devel@lists.xenproject.org; Thu, 22 Feb 2018 14:42:24 +0000
In-Reply-To: <20180220141015.30714-5-roger.pau@citrix.com>
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

Pj4+IE9uIDIwLjAyLjE4IGF0IDE1OjEwLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
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
ICAgIF4KPiAKPiBOb3RlIHRoYXQgdGhpcyBpcyBhIHByZXBhcmF0b3J5IHBhdGNoIGluIG9yZGVy
IHRvIGVuYWJsZSBjbGFuZydzCj4gaW50ZWdyYXRlZCBhc3NlbWJsZXIsIHRoZSBpbnRlZ3JhdGVk
IGFzc2VtYmxlciBpcyBub3QgeWV0IGVuYWJsZWQgZm9yCj4gYXNzZW1ibHkgZmlsZXMuCj4gCj4g
U2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CgpB
Y2tlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
