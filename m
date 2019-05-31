From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH] xen: notifier: refine 'notifier_head',
 use 'list_head' directly
Date: Fri, 31 May 2019 11:22:13 +0100
Message-ID: <6db51cab-7372-d55d-c0a5-481afc21e5c8@arm.com>
References: <1559270128-28496-1-git-send-email-chenbaodong@mxnavi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2tza=T7=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hWefz-0000aY-47
 for xen-devel@lists.xenproject.org; Fri, 31 May 2019 10:22:19 +0000
In-Reply-To: <1559270128-28496-1-git-send-email-chenbaodong@mxnavi.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Baodong Chen <chenbaodong@mxnavi.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

SGksCgpNaXNzaW5nIGNvbW1pdCBtZXNzYWdlIGhlcmUuCgpPbiA1LzMxLzE5IDM6MzUgQU0sIEJh
b2RvbmcgQ2hlbiB3cm90ZToKPiBTaWduZWQtb2ZmLWJ5OiBCYW9kb25nIENoZW4gPGNoZW5iYW9k
b25nQG14bmF2aS5jb20+Cj4gLS0tCj4gICB4ZW4vY29tbW9uL25vdGlmaWVyLmMgICAgICB8IDI1
ICsrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgIHhlbi9pbmNsdWRlL3hlbi9ub3RpZmllci5o
IHwgMjEgKysrKysrKysrKysrKysrLS0tLS0tCj4gICAyIGZpbGVzIGNoYW5nZWQsIDIxIGluc2Vy
dGlvbnMoKyksIDI1IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS94ZW4vY29tbW9uL25v
dGlmaWVyLmMgYi94ZW4vY29tbW9uL25vdGlmaWVyLmMKPiBpbmRleCAzNDQ4OGE4Li5mOTU5YTc5
IDEwMDY0NAo+IC0tLSBhL3hlbi9jb21tb24vbm90aWZpZXIuYwo+ICsrKyBiL3hlbi9jb21tb24v
bm90aWZpZXIuYwo+IEBAIC0yMSwxMCArMjEsMTAgQEAKPiAgIHZvaWQgX19pbml0IG5vdGlmaWVy
X2NoYWluX3JlZ2lzdGVyKAo+ICAgICAgIHN0cnVjdCBub3RpZmllcl9oZWFkICpuaCwgc3RydWN0
IG5vdGlmaWVyX2Jsb2NrICpuKQo+ICAgewo+IC0gICAgc3RydWN0IGxpc3RfaGVhZCAqY2hhaW4g
PSAmbmgtPmhlYWQuY2hhaW47Cj4gKyAgICBzdHJ1Y3QgbGlzdF9oZWFkICpjaGFpbiA9ICZuaC0+
aGVhZDsKPiAgICAgICBzdHJ1Y3Qgbm90aWZpZXJfYmxvY2sgKm5iOwo+ICAgCj4gLSAgICB3aGls
ZSAoIGNoYWluLT5uZXh0ICE9ICZuaC0+aGVhZC5jaGFpbiApCj4gKyAgICB3aGlsZSAoIGNoYWlu
LT5uZXh0ICE9ICZuaC0+aGVhZCApCj4gICAgICAgewo+ICAgICAgICAgICBuYiA9IGxpc3RfZW50
cnkoY2hhaW4tPm5leHQsIHN0cnVjdCBub3RpZmllcl9ibG9jaywgY2hhaW4pOwo+ICAgICAgICAg
ICBpZiAoIG4tPnByaW9yaXR5ID4gbmItPnByaW9yaXR5ICkKPiBAQCAtMzUsMTkgKzM1LDYgQEAg
dm9pZCBfX2luaXQgbm90aWZpZXJfY2hhaW5fcmVnaXN0ZXIoCj4gICAgICAgbGlzdF9hZGQoJm4t
PmNoYWluLCBjaGFpbik7Cj4gICB9Cj4gICAKPiAtLyoqCj4gLSAqIG5vdGlmaWVyX2NoYWluX3Vu
cmVnaXN0ZXIgLSBSZW1vdmUgbm90aWZpZXIgZnJvbSBhIHJhdyBub3RpZmllciBjaGFpbgo+IC0g
KiBAbmg6IFBvaW50ZXIgdG8gaGVhZCBvZiB0aGUgcmF3IG5vdGlmaWVyIGNoYWluCj4gLSAqIEBu
OiBFbnRyeSB0byByZW1vdmUgZnJvbSBub3RpZmllciBjaGFpbgo+IC0gKgo+IC0gKiBSZW1vdmVz
IGEgbm90aWZpZXIgZnJvbSBhIHJhdyBub3RpZmllciBjaGFpbi4KPiAtICogQWxsIGxvY2tpbmcg
bXVzdCBiZSBwcm92aWRlZCBieSB0aGUgY2FsbGVyLgo+IC0gKi8KPiAtdm9pZCBfX2luaXQgbm90
aWZpZXJfY2hhaW5fdW5yZWdpc3RlcigKPiAtICAgIHN0cnVjdCBub3RpZmllcl9oZWFkICpuaCwg
c3RydWN0IG5vdGlmaWVyX2Jsb2NrICpuKQo+IC17Cj4gLSAgICBsaXN0X2RlbCgmbi0+Y2hhaW4p
Owo+IC19CgpXaHkgZGlkIHlvdSBtb3ZlIHRoZSBmdW5jdGlvbj8KCkNoZWVycywKCi0tIApKdWxp
ZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
