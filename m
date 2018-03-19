From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v2 09/45] ARM: GIC: Allow tweaking the
 active and pending state of an IRQ
Date: Mon, 19 Mar 2018 09:30:25 +0000
Message-ID: <c2704d4e-6ac0-7e82-87d4-825ce9d3677a@arm.com>
References: <20180315203050.19791-1-andre.przywara@linaro.org>
 <20180315203050.19791-10-andre.przywara@linaro.org>
 <5cce550e-e6ce-a237-f83b-d264930c877f@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=wrgj=gj=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1exjdc-0003rM-Ac
 for xen-devel@lists.xenproject.org; Mon, 19 Mar 2018 01:31:00 +0000
In-Reply-To: <5cce550e-e6ce-a237-f83b-d264930c877f@linaro.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andre Przywara <andre.przywara@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

CgpPbiAwMy8xNi8yMDE4IDA0OjA1IFBNLCBBbmRyZSBQcnp5d2FyYSB3cm90ZToKPiBIaSwKCkhp
IEFuZHJlLAoKPiBPbiAxNS8wMy8xOCAyMDozMCwgQW5kcmUgUHJ6eXdhcmEgd3JvdGU6Cj4+ICsg
ICAgfQo+PiArfQo+PiArCj4+ICtzdGF0aWMgdm9pZCBnaWN2Ml9zZXRfcGVuZGluZ19zdGF0ZShz
dHJ1Y3QgaXJxX2Rlc2MgKmlycWQsIGJvb2wgcGVuZGluZykKPj4gK3sKPj4gKyAgICBBU1NFUlQo
c3Bpbl9pc19sb2NrZWQoJmlycWQtPmxvY2spKTsKPj4gKwo+PiArICAgIGlmICggcGVuZGluZyAp
Cj4+ICsgICAgewo+PiArICAgICAgICAvKiBUaGUgSU5QUk9HUkVTUyBiaXQgd2lsbCBiZSBzZXQg
d2hlbiB0aGUgaW50ZXJydXB0IGZpcmVzLiAqLwo+PiArICAgICAgICBnaWN2Ml9wb2tlX2lycShp
cnFkLCBHSUNEX0lTUEVORFIpOwo+PiArICAgIH0KPj4gKyAgICBlbHNlCj4+ICsgICAgewo+PiAr
ICAgICAgICBnaWN2Ml9wb2tlX2lycShpcnFkLCBHSUNEX0lDUEVORFIpOwo+PiArICAgICAgICBp
ZiAoICFnaWN2Ml9wZWVrX2lycShpcnFkLCBHSUNEX0lTQUNUSVZFUikgJiYKPj4gKyAgICAgICAg
ICAgICB0ZXN0X2JpdChfSVJRX0dVRVNULCAmaXJxZC0+c3RhdHVzKSApCj4+ICsgICAgICAgICAg
ICBjbGVhcl9iaXQoX0lSUV9JTlBST0dSRVNTLCAmaXJxZC0+c3RhdHVzKTsKPiAKPiBXZSBzaG91
bGQgbm90IG5lZWQgdG8gdG91Y2ggdGhlIF9JUlFfSU5QUk9HUkVTUyBiaXQgaGVyZS4gVGhhdCBi
aXQKPiByZWFsbHkgc2hhZG93cyB0aGUgKmFjdGl2ZSogYml0LCBzbyBjaGFuZ2luZyB0aGUgcGVu
ZGluZyBzdGF0ZSBzaG91bGQKPiBub3QgbWF0dGVyIGhlcmU6Cj4gLSBJZiB0aGUgaC93IElSUSBp
cyBhY3RpdmUsIHRoZSBiaXQgaXMgc2V0IGFscmVhZHkgYW5kIHNob3VsZCByZW1haW4gc28sCj4g
YXMgWGVuIGFuZCB0aGUgZ3Vlc3QgYXJlIHN0aWxsIGRlYWxpbmcgd2l0aCBpdC4gQ2xlYXJpbmcg
dGhlIGgvdyBwZW5kaW5nCj4gc3RhdGUgZG9lcyBub3QgY2hhbmdlIHRoYXQuCj4gLSBJZiB0aGUg
aC93IElSUSBpcyBub3QgYWN0aXZlLCB0aGUgX0lSUV9JTlBST0dSRVNTIGJpdCBpcyBub3Qgc2V0
LCBzbwo+IGNsZWFyaW5nIGl0IHdvdWxkIGJlIGEgTk9QLgo+IFNvIHdlIGNhbiByZW1vdmUgIHRo
ZSBfSVJRX0lOUFJPR1JFU1MgaGFuZGxpbmcgaGVyZSBjb21wbGV0ZWx5Lgo+IAo+IEkgd2lsbCBh
bWVuZCB0aGUgY29kZSBhY2NvcmRpbmdseSwgaW5jbHVkaW5nIHRoZSByZXNwZWN0aXZlIEdJQ3Yz
IHBhcnRzLgoKVGhhbmsgeW91IGZvciBzdW1tYXJpemluZyBvdXIgZGlzY3Vzc2lvbi4gSXMgaXQg
c3RpbGwgbWFraW5nIHNlbnNlIHRvIApkb2N1bWVudCBob3cgdGhvc2UgaGVscGVycyBzaG91bGQg
YmUgY2FsbGVkPwoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
