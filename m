From: chenbaodong <chenbaodong@mxnavi.com>
Subject: Re: [PATCH] xen: cpu: change 'cpu_hotplug_[begin|done]'
 to inline function
Date: Mon, 3 Jun 2019 09:52:41 +0800
Message-ID: <676cd57f-99b6-22a5-c008-cf707448f5ba@mxnavi.com>
References: <d7e6554e6990789d1b619b6d489f52b7@sslemail.net>
 <33f34cf9-2b67-baa9-8b3c-98fa08e70ddd@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WQxh=UC=mxnavi.com=chenbaodong@srs-us1.protection.inumbo.net>)
 id 1hXc9c-0002CY-5v
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 01:52:52 +0000
In-Reply-To: <33f34cf9-2b67-baa9-8b3c-98fa08e70ddd@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

Ck9uIDUvMzEvMTkgMTg6NTUsIEp1bGllbiBHcmFsbCB3cm90ZToKPiBIaSwKPgo+IE9uIDUvMzEv
MTkgMzo0NiBBTSwgQmFvZG9uZyBDaGVuIHdyb3RlOgo+PiBTaWduZWQtb2ZmLWJ5OiBCYW9kb25n
IENoZW4gPGNoZW5iYW9kb25nQG14bmF2aS5jb20+Cj4+IC0tLQo+PiDCoCB4ZW4vY29tbW9uL2Nw
dS5jwqDCoMKgwqDCoCB8IDEwIC0tLS0tLS0tLS0KPj4gwqAgeGVuL2luY2x1ZGUveGVuL2NwdS5o
IHzCoCA0ICsrLS0KPj4gwqAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEyIGRl
bGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9jcHUuYyBiL3hlbi9jb21t
b24vY3B1LmMKPj4gaW5kZXggZjM4OGQ4OS4uYTUyNmI1NSAxMDA2NDQKPj4gLS0tIGEveGVuL2Nv
bW1vbi9jcHUuYwo+PiArKysgYi94ZW4vY29tbW9uL2NwdS5jCj4+IEBAIC01MSwxNiArNTEsNiBA
QCB2b2lkIHB1dF9jcHVfbWFwcyh2b2lkKQo+PiDCoMKgwqDCoMKgIHNwaW5fdW5sb2NrX3JlY3Vy
c2l2ZSgmY3B1X2FkZF9yZW1vdmVfbG9jayk7Cj4+IMKgIH0KPj4gwqAgLWJvb2xfdCBjcHVfaG90
cGx1Z19iZWdpbih2b2lkKQo+PiAtewo+PiAtwqDCoMKgIHJldHVybiBnZXRfY3B1X21hcHMoKTsK
Pj4gLX0KPj4gLQo+PiAtdm9pZCBjcHVfaG90cGx1Z19kb25lKHZvaWQpCj4+IC17Cj4+IC3CoMKg
wqAgcHV0X2NwdV9tYXBzKCk7Cj4+IC19Cj4+IC0KPj4gwqAgc3RhdGljIE5PVElGSUVSX0hFQUQo
Y3B1X2NoYWluKTsKPj4gwqAgwqAgdm9pZCBfX2luaXQgcmVnaXN0ZXJfY3B1X25vdGlmaWVyKHN0
cnVjdCBub3RpZmllcl9ibG9jayAqbmIpCj4+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94ZW4v
Y3B1LmggYi94ZW4vaW5jbHVkZS94ZW4vY3B1LmgKPj4gaW5kZXggNDYzOGM1MC4uNzBhMmRmNCAx
MDA2NDQKPj4gLS0tIGEveGVuL2luY2x1ZGUveGVuL2NwdS5oCj4+ICsrKyBiL3hlbi9pbmNsdWRl
L3hlbi9jcHUuaAo+PiBAQCAtMTAsOCArMTAsOCBAQCBib29sX3QgZ2V0X2NwdV9tYXBzKHZvaWQp
Owo+PiDCoCB2b2lkIHB1dF9jcHVfbWFwcyh2b2lkKTsKPj4gwqAgwqAgLyogU2FmZWx5IHBlcmZv
cm0gQ1BVIGhvdHBsdWcgYW5kIHVwZGF0ZSBjcHVfb25saW5lX21hcCwgZXRjLiAqLwo+PiAtYm9v
bF90IGNwdV9ob3RwbHVnX2JlZ2luKHZvaWQpOwo+PiAtdm9pZCBjcHVfaG90cGx1Z19kb25lKHZv
aWQpOwo+PiArc3RhdGljIGlubGluZSBib29sX3QgY3B1X2hvdHBsdWdfYmVnaW4odm9pZCkgeyBy
ZXR1cm4gZ2V0X2NwdV9tYXBzKCk7IH0KPj4gK3N0YXRpYyBpbmxpbmUgdm9pZCBjcHVfaG90cGx1
Z19kb25lKHZvaWQpIHsgcHV0X2NwdV9tYXBzKCk7IH0KPgo+IFRoZSBjb2Rpbmcgc3R5bGUgc2hv
dWxkIGJlOgo+Cj4gc3RhdGljIGlubGluZS4uLi4KPiB7Cj4gwqDCoMKgwqDCoCAuLi4KPiB9Cj4K
WWVzLCBjbGFuZy1mb3JtYXQgYXV0b21hdGVkIGZvcm1hdCBjb2RlIGZvciBtZSwgd2lsbCBiZSBm
aXhlZC4KPj4gwqAgwqAgLyogUmVjZWl2ZSBub3RpZmljYXRpb24gb2YgQ1BVIGhvdHBsdWcgZXZl
bnRzLiAqLwo+PiDCoCB2b2lkIHJlZ2lzdGVyX2NwdV9ub3RpZmllcihzdHJ1Y3Qgbm90aWZpZXJf
YmxvY2sgKm5iKTsKPj4KPgo+IENoZWVycywKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
