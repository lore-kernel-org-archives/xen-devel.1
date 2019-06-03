From: chenbaodong <chenbaodong@mxnavi.com>
Subject: Re: [PATCH] xen: cpu: change 'cpu_hotplug_[begin|done]'
 to inline function
Date: Mon, 3 Jun 2019 09:56:01 +0800
Message-ID: <37db96f6-09bb-7731-5117-7b3d2af8f934@mxnavi.com>
References: <40e0b331ac1c4e349f79491dfb977c0e@sslemail.net>
 <5CF1104A0200007800233FB2@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WQxh=UC=mxnavi.com=chenbaodong@srs-us1.protection.inumbo.net>)
 id 1hXcCq-0002LI-Jy
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 01:56:12 +0000
In-Reply-To: <5CF1104A0200007800233FB2@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Ck9uIDUvMzEvMTkgMTk6MzAsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDMxLjA1LjE5IGF0
IDEyOjU1LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+PiBPbiA1LzMxLzE5IDM6NDYg
QU0sIEJhb2RvbmcgQ2hlbiB3cm90ZToKPj4+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9jcHUuaAo+
Pj4gKysrIGIveGVuL2luY2x1ZGUveGVuL2NwdS5oCj4+PiBAQCAtMTAsOCArMTAsOCBAQCBib29s
X3QgZ2V0X2NwdV9tYXBzKHZvaWQpOwo+Pj4gICAgdm9pZCBwdXRfY3B1X21hcHModm9pZCk7Cj4+
PiAgICAKPj4+ICAgIC8qIFNhZmVseSBwZXJmb3JtIENQVSBob3RwbHVnIGFuZCB1cGRhdGUgY3B1
X29ubGluZV9tYXAsIGV0Yy4gKi8KPj4+IC1ib29sX3QgY3B1X2hvdHBsdWdfYmVnaW4odm9pZCk7
Cj4+PiAtdm9pZCBjcHVfaG90cGx1Z19kb25lKHZvaWQpOwo+Pj4gK3N0YXRpYyBpbmxpbmUgYm9v
bF90IGNwdV9ob3RwbHVnX2JlZ2luKHZvaWQpIHsgcmV0dXJuIGdldF9jcHVfbWFwcygpOyB9Cj4+
PiArc3RhdGljIGlubGluZSB2b2lkIGNwdV9ob3RwbHVnX2RvbmUodm9pZCkgeyBwdXRfY3B1X21h
cHMoKTsgfQo+IFBsdXMgcGxlYXNlIHN3aXRjaCB0byBib29sIGF0IHRoZSBzYW1lIHRpbWUuCgpZ
ZXMsIHR5cGVzIGxpa2UgYm9vdF90IG9yIHUzMiBhcmUgZ2V0dGluZyByaWQgb2YsIHNvIHNob3Vs
ZCBOb3QgYmUgdXNlZC4KCldpbGwgYmUgZml4ZWQuCgo+Cj4gSmFuCj4KPgo+IC4KPgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
