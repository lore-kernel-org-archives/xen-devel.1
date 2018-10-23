From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/2] x86/monitor: Introduce a boolean to
 suppress nested monitoring events
Date: Tue, 23 Oct 2018 16:08:28 +0100
Message-ID: <9a325052-409c-d6b0-d6fe-fe685b3a6325@citrix.com>
References: <1540305323-31554-1-git-send-email-andrew.cooper3@citrix.com>
 <1540305323-31554-2-git-send-email-andrew.cooper3@citrix.com>
 <c8b82aca-c24a-0dfc-5321-e95a984c24f5@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <c8b82aca-c24a-0dfc-5321-e95a984c24f5@bitdefender.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>, Xen-devel <xen-devel@lists.xen.org>
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjMvMTAvMTggMTU6NTQsIFJhenZhbiBDb2pvY2FydSB3cm90ZToKPiBPbiAxMC8yMy8xOCA1
OjM1IFBNLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2
L2h2bS9tb25pdG9yLmMgYi94ZW4vYXJjaC94ODYvaHZtL21vbml0b3IuYwo+PiBpbmRleCAyYTQx
Y2NjLi5mMWExOTZmIDEwMDY0NAo+PiAtLS0gYS94ZW4vYXJjaC94ODYvaHZtL21vbml0b3IuYwo+
PiArKysgYi94ZW4vYXJjaC94ODYvaHZtL21vbml0b3IuYwo+PiBAQCAtMzYsNiArMzYsOSBAQCBi
b29sIGh2bV9tb25pdG9yX2NyKHVuc2lnbmVkIGludCBpbmRleCwgdW5zaWduZWQgbG9uZyB2YWx1
ZSwgdW5zaWduZWQgbG9uZyBvbGQpCj4+ICAgICAgc3RydWN0IGFyY2hfZG9tYWluICphZCA9ICZj
dXJyLT5kb21haW4tPmFyY2g7Cj4+ICAgICAgdW5zaWduZWQgaW50IGN0cmxyZWdfYml0bWFzayA9
IG1vbml0b3JfY3RybHJlZ19iaXRtYXNrKGluZGV4KTsKPj4gIAo+PiArICAgIGlmICggY3Vyci0+
bW9uaXRvci5zdXBwcmVzcyApCj4+ICsgICAgICAgIHJldHVybiAwOwo+PiArCj4+ICAgICAgaWYg
KCBpbmRleCA9PSBWTV9FVkVOVF9YODZfQ1IzICYmIGh2bV9wY2lkX2VuYWJsZWQoY3VycikgKQo+
PiAgICAgICAgICB2YWx1ZSAmPSB+WDg2X0NSM19OT0ZMVVNIOyAvKiBDbGVhciB0aGUgbm9mbHVz
aCBiaXQuICovCj4+ICAKPj4gQEAgLTczLDYgKzc2LDkgQEAgYm9vbCBodm1fbW9uaXRvcl9lbXVs
X3VuaW1wbGVtZW50ZWQodm9pZCkKPj4gICAgICAgICAgLnZjcHVfaWQgID0gY3Vyci0+dmNwdV9p
ZCwKPj4gICAgICB9Owo+PiAgCj4+ICsgICAgaWYgKCBjdXJyLT5tb25pdG9yLnN1cHByZXNzICkK
Pj4gKyAgICAgICAgcmV0dXJuIGZhbHNlOwo+IFJhdGhlciB0aGFuIGRvaW5nIHRoaXMgZm9yIGVh
Y2ggZXZlbnQsIEkgdGhpbmsgd2UgbWF5IGJlIGFibGUgdG8gZG8gaXQKPiBvbmx5IGluIG1vbml0
b3JfdHJhcHMoKS4gQW0gSSBtaXNzaW5nIHNvbWV0aGluZz8KCkkgZ3Vlc3MgdGhhdCBkZXBlbmRz
IG9uIGhvdyBleHBlbnNpdmUgaXQgaXMgdG8gY29sbGVjdCB0b2dldGhlciB0aGUKb3RoZXIgZGF0
YSBiZWluZyBmZWQgaW50byB0aGUgbW9uaXRvciByaW5nLsKgIEkgc3VwcG9zZSBpdCBpcyBvbmx5
IHRoZQpodm1fZG9fcmVzdW1lKCkgcGF0aCB3aGljaCB3aWxsIHN1ZmZlciwgYW5kIG9ubHkgb24g
YSByZXBseSBmcm9tCmludHJvc3BlY3Rpb24sIHdoaWNoIGlzbid0IGV4YWN0bHkgYSBmYXN0cGF0
aC4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
