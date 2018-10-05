From: Arun KS <arunks@codeaurora.org>
Subject: Re: [PATCH v4] memory_hotplug: Free pages as higher
 order
Date: Fri, 05 Oct 2018 12:54:45 +0530
Message-ID: <9ed0de45f2d7257c56e39efe43606d27__20687.0895730846$1538724219$gmane$org@codeaurora.org>
References: <1538573979-28365-1-git-send-email-arunks@codeaurora.org>
 <20181004145108.GH22173@dhcp22.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=lkho=mr=codeaurora.org=arunks@srs-us1.protection.inumbo.net>)
 id 1g8KTi-0001fs-9R
 for xen-devel@lists.xenproject.org; Fri, 05 Oct 2018 07:24:50 +0000
In-Reply-To: <20181004145108.GH22173@dhcp22.suse.cz>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Michal Hocko <mhocko@kernel.org>
Cc: vatsa@codeaurora.org, linux-mm@kvack.org, getarunks@gmail.com, kys@microsoft.com, boris.ostrovsky@oracle.com, sthemmin@microsoft.com, xen-devel@lists.xenproject.org, haiyangz@microsoft.com, yasu.isimatu@gmail.com, dan.j.williams@intel.com, akpm@linux-foundation.org, vbabka@suse.cz, osalvador@suse.de, jgross@suse.com, aaron.lu@intel.com, malat@debian.org, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, vinmenon@codeaurora.org, jrdr.linux@gmail.com, devel@linuxdriverproject.org, iamjoonsoo.kim@lge.com, mgorman@techsingularity.net, kirill.shutemov@linux.intel.com
List-Id: xen-devel@lists.xenproject.org

T24gMjAxOC0xMC0wNCAyMDoyMSwgTWljaGFsIEhvY2tvIHdyb3RlOgo+IE9uIFdlZCAwMy0xMC0x
OCAxOTowOTozOSwgQXJ1biBLUyB3cm90ZToKPiBbLi4uXQo+PiArc3RhdGljIGludCBvbmxpbmVf
cGFnZXNfYmxvY2tzKHVuc2lnbmVkIGxvbmcgc3RhcnQsIHVuc2lnbmVkIGxvbmcgCj4+IG5yX3Bh
Z2VzKQo+PiArewo+PiArCXVuc2lnbmVkIGxvbmcgZW5kID0gc3RhcnQgKyBucl9wYWdlczsKPj4g
KwlpbnQgb3JkZXIsIHJldCwgb25saW5lZF9wYWdlcyA9IDA7Cj4+ICsKPj4gKwl3aGlsZSAoc3Rh
cnQgPCBlbmQpIHsKPj4gKwkJb3JkZXIgPSBtaW4oTUFYX09SREVSIC0gMVVMLCBfX2ZmcyhzdGFy
dCkpOwo+PiArCj4+ICsJCXdoaWxlIChzdGFydCArICgxVUwgPDwgb3JkZXIpID4gZW5kKQo+PiAr
CQkJb3JkZXItLTsKPiAKPiB0aGlzIHJlYWxseSBtYWRlIG1lIHNjcmF0Y2ggbXkgaGVhZC4gV291
bGRuJ3QgaXQgYmUgbXVjaCBzaW1wbGVyIHRvIGRvCj4gdGhlIGZvbGxvd2luZz8KPiAJCW9yZGVy
ID0gbWluKE1BWF9PUkRFUiAtIDEsIGdldF9vcmRlcihlbmQgLSBzdGFydCkpPwoKWWVzLiBNdWNo
IGJldHRlci4gV2lsbCBjaGFuZ2UgdG8sCgogICAgICAgICAgICAgICAgIG9yZGVyID0gbWluKE1B
WF9PUkRFUiAtIDEsCiAgICAgICAgICAgICAgICAgICAgICAgICBnZXRfb3JkZXIoUEZOX1BIWVMo
ZW5kKSAtIFBGTl9QSFlTKHN0YXJ0KSkpOwoKPiAKPj4gKwo+PiArCQlyZXQgPSAoKm9ubGluZV9w
YWdlX2NhbGxiYWNrKShwZm5fdG9fcGFnZShzdGFydCksIG9yZGVyKTsKPj4gKwkJaWYgKCFyZXQp
Cj4+ICsJCQlvbmxpbmVkX3BhZ2VzICs9ICgxVUwgPDwgb3JkZXIpOwo+PiArCQllbHNlIGlmIChy
ZXQgPiAwKQo+PiArCQkJb25saW5lZF9wYWdlcyArPSByZXQ7Cj4+ICsKPj4gKwkJc3RhcnQgKz0g
KDFVTCA8PCBvcmRlcik7Cj4+ICsJfQo+PiArCXJldHVybiBvbmxpbmVkX3BhZ2VzOwo+PiAgfQo+
IFsuLi5dCj4+IC1zdGF0aWMgdm9pZCBfX2luaXQgX19mcmVlX3BhZ2VzX2Jvb3RfY29yZShzdHJ1
Y3QgcGFnZSAqcGFnZSwgdW5zaWduZWQgCj4+IGludCBvcmRlcikKPj4gK3ZvaWQgX19mcmVlX3Bh
Z2VzX2NvcmUoc3RydWN0IHBhZ2UgKnBhZ2UsIHVuc2lnbmVkIGludCBvcmRlcikKPj4gIHsKPj4g
IAl1bnNpZ25lZCBpbnQgbnJfcGFnZXMgPSAxIDw8IG9yZGVyOwo+PiAgCXN0cnVjdCBwYWdlICpw
ID0gcGFnZTsKPj4gIAl1bnNpZ25lZCBpbnQgbG9vcDsKPj4gCj4+IC0JcHJlZmV0Y2h3KHApOwo+
PiAtCWZvciAobG9vcCA9IDA7IGxvb3AgPCAobnJfcGFnZXMgLSAxKTsgbG9vcCsrLCBwKyspIHsK
Pj4gLQkJcHJlZmV0Y2h3KHAgKyAxKTsKPj4gKwlmb3IgKGxvb3AgPSAwOyBsb29wIDwgbnJfcGFn
ZXM7IGxvb3ArKywgcCsrKSB7Cj4+ICAJCV9fQ2xlYXJQYWdlUmVzZXJ2ZWQocCk7Cj4+ICAJCXNl
dF9wYWdlX2NvdW50KHAsIDApOwo+PiAgCX0KPj4gLQlfX0NsZWFyUGFnZVJlc2VydmVkKHApOwo+
PiAtCXNldF9wYWdlX2NvdW50KHAsIDApOwo+PiAKPj4gIAlwYWdlX3pvbmUocGFnZSktPm1hbmFn
ZWRfcGFnZXMgKz0gbnJfcGFnZXM7Cj4+ICAJc2V0X3BhZ2VfcmVmY291bnRlZChwYWdlKTsKPiAK
PiBJIHRoaW5rIHRoaXMgaXMgd29ydCBhIHNlcGFyYXRlIHBhdGNoIGFzIGl0IGlzIHVucmVsYXRl
ZCB0byB0aGUgcGF0Y2guClN1cmUuIFdpbGwgc3BsaXQgdGhlIHBhdGNoLgoKUmVnYXJkcywKQXJ1
bgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
