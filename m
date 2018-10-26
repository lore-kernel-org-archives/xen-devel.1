From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3 02/34] x86/HVM: grow MMIO cache data size
 to 64 bytes
Date: Fri, 26 Oct 2018 12:29:30 +0100
Message-ID: <d2814fd9-9b5d-0915-06aa-4e525824d070@citrix.com>
References: <5B6BF83602000078001DC548@prv1-mh.provo.novell.com>
 <5BA0E58F02000078001E94CE@prv1-mh.provo.novell.com>
 <5BA0E74702000078001E952E@prv1-mh.provo.novell.com>
 <9c61c76a-3ea4-9d2e-3ba1-46fd81184a3d@citrix.com>
 <5BD2D8A802000078001F4EEC@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=f8h9=ng=citrix.com=prvs=8302ac893=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gG0J3-0002rz-Ps
 for xen-devel@lists.xenproject.org; Fri, 26 Oct 2018 11:29:33 +0000
In-Reply-To: <5BD2D8A802000078001F4EEC@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjYvMTAvMTggMTA6MDQsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDI1LjEwLjE4IGF0
IDIwOjM2LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+IE9uIDE4LzA5LzE4
IDEyOjUzLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+IFRoaXMgaXMgbmVlZGVkIGJlZm9yZSBlbmFi
bGluZyBhbnkgQVZYNTEyIGluc25zIGluIHRoZSBlbXVsYXRvci4gQ2hhbmdlCj4+PiB0aGUgd2F5
IGFsaWdubWVudCBpcyBlbmZvcmNlZCBhdCB0aGUgc2FtZSB0aW1lLgo+Pj4KPj4+IEFkZCBhIGNo
ZWNrIHRoYXQgdGhlIGJ1ZmZlciB3b24ndCBhY3R1YWxseSBvdmVyZmxvdywgYW5kIHdoaWxlIGF0
IGl0Cj4+PiBhbHNvIGNvbnZlcnQgdGhlIGNoZWNrIGZvciBhY2Nlc3NlcyB0byBub3QgY3Jvc3Mg
cGFnZSBib3VuZGFyaWVzLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4KPj4+IC0tLQo+Pj4gdjM6IE5ldy4KPj4+Cj4+PiAtLS0gYS94ZW4vYXJj
aC94ODYvaHZtL2VtdWxhdGUuYwo+Pj4gKysrIGIveGVuL2FyY2gveDg2L2h2bS9lbXVsYXRlLmMK
Pj4+IEBAIC04NjYsNyArODY2LDE4IEBAIHN0YXRpYyBpbnQgaHZtZW11bF9waHlzX21taW9fYWNj
ZXNzKAo+Pj4gICAgICBpbnQgcmMgPSBYODZFTVVMX09LQVk7Cj4+PiAgCj4+PiAgICAgIC8qIEFj
Y2Vzc2VzIG11c3QgZmFsbCB3aXRoaW4gYSBwYWdlLiAqLwo+Pj4gLSAgICBCVUdfT04oKGdwYSAm
IH5QQUdFX01BU0spICsgc2l6ZSA+IFBBR0VfU0laRSk7Cj4+PiArICAgIGlmICggKGdwYSAmIH5Q
QUdFX01BU0spICsgc2l6ZSA+IFBBR0VfU0laRSApCj4+PiArICAgIHsKPj4+ICsgICAgICAgIEFT
U0VSVF9VTlJFQUNIQUJMRSgpOwo+Pj4gKyAgICAgICAgcmV0dXJuIFg4NkVNVUxfVU5IQU5ETEVB
QkxFOwo+Pj4gKyAgICB9Cj4+PiArCj4+PiArICAgIC8qIEFjY2Vzc2VzIG11c3Qgbm90IG92ZXJm
bG93IHRoZSBjYWNoZSdzIGJ1ZmZlci4gKi8KPj4+ICsgICAgaWYgKCBzaXplID4gc2l6ZW9mKGNh
Y2hlLT5idWZmZXIpICkKPj4+ICsgICAgewo+Pj4gKyAgICAgICAgQVNTRVJUX1VOUkVBQ0hBQkxF
KCk7Cj4+PiArICAgICAgICByZXR1cm4gWDg2RU1VTF9VTkhBTkRMRUFCTEU7Cj4+PiArICAgIH0K
Pj4+ICAKPj4+ICAgICAgLyoKPj4+ICAgICAgICogaHZtZW11bF9kb19pbygpIGNhbm5vdCBoYW5k
bGUgbm9uLXBvd2VyLW9mLTIgYWNjZXNzZXMgb3IKPj4+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS14
ODYvaHZtL3ZjcHUuaAo+Pj4gKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vdmNwdS5oCj4+
PiBAQCAtNDIsMTUgKzQyLDE0IEBAIHN0cnVjdCBodm1fdmNwdV9hc2lkIHsKPj4+ICB9Owo+Pj4g
IAo+Pj4gIC8qCj4+PiAtICogV2UgbWF5IHJlYWQgb3Igd3JpdGUgdXAgdG8gbTI1NiBhcyBhIG51
bWJlciBvZiBkZXZpY2UtbW9kZWwKPj4+ICsgKiBXZSBtYXkgcmVhZCBvciB3cml0ZSB1cCB0byBt
NTEyIGFzIGEgbnVtYmVyIG9mIGRldmljZS1tb2RlbAo+Pj4gICAqIHRyYW5zYWN0aW9ucy4KPj4+
ICAgKi8KPj4+ICBzdHJ1Y3QgaHZtX21taW9fY2FjaGUgewo+Pj4gICAgICB1bnNpZ25lZCBsb25n
IGdsYTsKPj4+ICAgICAgdW5zaWduZWQgaW50IHNpemU7Cj4+PiAgICAgIHVpbnQ4X3QgZGlyOwo+
Pj4gLSAgICB1aW50OF90IHBhZFszXTsgLyogbWFrZSBidWZmZXJbXSBsb25nLWFsaWduZWQgKi8K
Pj4+IC0gICAgdWludDhfdCBidWZmZXJbMzJdOwo+Pj4gKyAgICB1aW50OF90IGJ1ZmZlcls2NF0g
X19hbGlnbmVkKHNpemVvZihsb25nKSk7Cj4+IERvbid0IHdlIHdhbnQgaXQgMTYtYnl0ZSBhbGln
bmVkLCByYXRoZXIgdGhhbiA4Pwo+IFdoeT8gV2UgZG9uJ3QgYWNjZXNzIHRoZSBidWZmZXIgdmlh
IFNJTUQgaW5zbnMuCgpGYWlyIHBvaW50LsKgIEFja2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRy
ZXcuY29vcGVyM0BjaXRyaXguY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
