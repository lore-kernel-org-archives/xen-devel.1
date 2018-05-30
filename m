From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH 03/13] xen/arm: setup: Check errata for boot
 CPU later on
Date: Wed, 30 May 2018 10:17:16 +0100
Message-ID: <6f82c96b-5065-d66d-cabe-562bff609dff@arm.com>
References: <20180522174254.27551-1-julien.grall@arm.com>
 <20180522174254.27551-4-julien.grall@arm.com>
 <alpine.DEB.2.10.1805231434360.15101@sstabellini-ThinkPad-X260>
 <903bccf0-ceb7-d184-2b6c-c44afbf223a0@arm.com>
 <alpine.DEB.2.10.1805291430130.5563@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=2wu2=ir=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1fNxEQ-0007DP-Av
 for xen-devel@lists.xenproject.org; Wed, 30 May 2018 09:17:22 +0000
In-Reply-To: <alpine.DEB.2.10.1805291430130.5563@sstabellini-ThinkPad-X260>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, andre.przywara@arm.com
List-Id: xen-devel@lists.xenproject.org

SGkgU3RlZmFubywKCk9uIDA1LzI5LzIwMTggMTA6MzAgUE0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3
cm90ZToKPiBPbiBGcmksIDI1IE1heSAyMDE4LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IEhpIFN0
ZWZhbm8sCj4+Cj4+IE9uIDA1LzIzLzIwMTggMTA6MzQgUE0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3
cm90ZToKPj4+IE9uIFR1ZSwgMjIgTWF5IDIwMTgsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4+PiBT
b21lIGVycmF0YSB3aWxsIHJlbHkgb24gdGhlIFNNQ0NDIHZlcnNpb24gd2hpY2ggaXMgZGV0ZWN0
ZWQgYnkKPj4+PiBwc2NpX2luaXQoKS4KPj4+Pgo+Pj4+IFRoaXMgaXMgcGFydCBvZiBYU0EtMjYz
Lgo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJt
LmNvbT4KPj4+Cj4+PiBSZXZpZXdlZC1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGlu
aUBrZXJuZWwub3JnPgo+Pgo+PiBUaGFuayB5b3UgZm9yIHRoZSByZXZpZXcuIE9uIGFuIGludGVy
bmFsIHJldmlldyBBbmRyZSdzIHN1Z2dlc3RlZCB0byBtb3ZlCj4+IHBzY2lfaW5pdCgpIG91dHNp
ZGUgc21wX2luaXRfY3B1cygpLiBTb21ldGhpbmcgbGlrZToKPj4KPj4gICAgIHByb2Nlc3Nvcl9p
ZCgpOwo+Pgo+PiAgICAgIC8qIE5lZWQgUFNDSSB2ZXJzaW9uIGZvciBmaXJtd2FyZSBiYXNlZCBl
cnJhdGEgd29ya2Fyb3VuZHMgKi8KPj4gICAgICBwc2NpX2luaXQoKTsKPj4KPj4gICAgICBjaGVj
a19sb2NhbF9jcHVfZXJyYXRhKCk7Cj4+Cj4+ICAgICAgc21wX2luaXRfY3B1cygpOwo+Pgo+PiBJ
IGFtIHdvbmRlcmluZyB3aGV0aGVyIGl0IHdvdWxkIGJlIGNsZWFyZXIgdG8gaGF2ZS4gV2hhdCBk
byB5b3UgdGhpbms/Cj4gCj4gVGhhdCBhbHNvIHdvcmtzLiBJIGFtIGZpbmUgZWl0aGVyIHdheSwg
dGhleSBib3RoIGxvb2sgT0sgdG8gbWUuCgpJIHdpbGwga2VlcCB0aGUgY3VycmVudCB2ZXJzaW9u
IHRoZW4uCgpDaGVlcnMsCgo+IAo+IAo+Pgo+Pj4KPj4+PiAtLS0KPj4+PiAgICB4ZW4vYXJjaC9h
cm0vc2V0dXAuYyB8IDggKysrKysrLS0KPj4+PiAgICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQo+Pj4+Cj4+Pj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2Fy
bS9zZXR1cC5jIGIveGVuL2FyY2gvYXJtL3NldHVwLmMKPj4+PiBpbmRleCAxZDZmNmJmMzdlLi5h
YzkzZGU0Nzg2IDEwMDY0NAo+Pj4+IC0tLSBhL3hlbi9hcmNoL2FybS9zZXR1cC5jCj4+Pj4gKysr
IGIveGVuL2FyY2gvYXJtL3NldHVwLmMKPj4+PiBAQCAtMTcxLDggKzE3MSw2IEBAIHN0YXRpYyB2
b2lkIF9faW5pdCBwcm9jZXNzb3JfaWQodm9pZCkKPj4+PiAgICAgICAgfQo+Pj4+ICAgICAgICAg
IHByb2Nlc3Nvcl9zZXR1cCgpOwo+Pj4+IC0KPj4+PiAtICAgIGNoZWNrX2xvY2FsX2NwdV9lcnJh
dGEoKTsKPj4+PiAgICB9Cj4+Pj4gICAgICB2b2lkIGR0X3VucmVzZXJ2ZWRfcmVnaW9ucyhwYWRk
cl90IHMsIHBhZGRyX3QgZSwKPj4+PiBAQCAtNzc5LDYgKzc3NywxMiBAQCB2b2lkIF9faW5pdCBz
dGFydF94ZW4odW5zaWduZWQgbG9uZyBib290X3BoeXNfb2Zmc2V0LAo+Pj4+ICAgICAgICBwcmlu
dGsoWEVOTE9HX0lORk8gIlNNUDogQWxsb3dpbmcgJXUgQ1BVc1xuIiwgY3B1cyk7Cj4+Pj4gICAg
ICAgIG5yX2NwdV9pZHMgPSBjcHVzOwo+Pj4+ICAgICsgICAgLyoKPj4+PiArICAgICAqIFNvbWUg
ZXJyYXRhIHJlbGllcyBvbiBTTUNDQyB2ZXJzaW9uIHdoaWNoIGlzIGRldGVjdGVkIGJ5Cj4+Pj4g
cHNjaV9pbml0KCkKPj4+PiArICAgICAqIChjYWxsZWQgZnJvbSBzbXBfaW5pdF9jcHVzKCkpLgo+
Pj4+ICsgICAgICovCj4+Pj4gKyAgICBjaGVja19sb2NhbF9jcHVfZXJyYXRhKCk7Cj4+Pj4gKwo+
Pj4+ICAgICAgICBpbml0X3hlbl90aW1lKCk7Cj4+Pj4gICAgICAgICAgZ2ljX2luaXQoKTsKPj4+
PiAtLSAKPj4+PiAyLjExLjAKPj4+Pgo+Pgo+PiAtLSAKPj4gSnVsaWVuIEdyYWxsCj4+CgotLSAK
SnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
