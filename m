From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v4] x86/cpu: Add supports for zhaoxin x86
 platform
Date: Mon, 07 May 2018 04:34:17 -0600
Message-ID: <5AF02BA902000078001C1292@prv1-mh.provo.novell.com>
References: <1525657052-3871-1-git-send-email-Davidwang@zhaoxin.com>
 <5AF00D3D02000078001C118F@prv1-mh.provo.novell.com>
 <864332c36baa428da70672c67cb6a33b@zhaoxin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=f+xl=h2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fFdTK-0006hN-4v
 for xen-devel@lists.xenproject.org; Mon, 07 May 2018 10:34:22 +0000
In-Reply-To: <864332c36baa428da70672c67cb6a33b@zhaoxin.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Davidwang <Davidwang@zhaoxin.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, "Fiona Li(BJ-RD)" <FionaLi@zhaoxin.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA3LjA1LjE4IGF0IDEyOjExLCA8RGF2aWRXYW5nQHpoYW94aW4uY29tPiB3cm90ZToK
Pj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPj4gRnJvbTogSmFuIEJldWxpY2ggPEpCZXVs
aWNoQHN1c2UuY29tPgo+PiBTZW50OiBNb25kYXksIE1heSA3LCAyMDE4IDQ6MjQgUE0KPj4gCj4+
ID4+PiBPbiAwNy4wNS4xOCBhdCAwMzozNywgPERhdmlkd2FuZ0B6aGFveGluLmNvbT4gd3JvdGU6
Cj4+ID4gLS0tIGEveGVuL2FyY2gveDg2L2NwdS9pbnRlbF9jYWNoZWluZm8uYwo+PiA+ICsrKyBi
L3hlbi9hcmNoL3g4Ni9jcHUvaW50ZWxfY2FjaGVpbmZvLmMKPj4gPiBAQCAtMTc2LDcgKzE3Niw5
IEBAIHVuc2lnbmVkIGludCBpbml0X2ludGVsX2NhY2hlaW5mbyhzdHJ1Y3QgY3B1aW5mb194ODYK
Pj4gKmMpCj4+ID4gIAkgKiBEb24ndCB1c2UgY3B1aWQyIGlmIGNwdWlkNCBpcyBzdXBwb3J0ZWQu
IEZvciBQNCwgd2UgdXNlIGNwdWlkMiBmb3IKPj4gPiAgCSAqIHRyYWNlIGNhY2hlCj4+ID4gIAkg
Ki8KPj4gPiAtCWlmICgobnVtX2NhY2hlX2xlYXZlcyA9PSAwIHx8IGMtPng4NiA9PSAxNSkgJiYg
Yy0+Y3B1aWRfbGV2ZWwgPiAxKSB7Cj4+ID4gKwlpZiAoIChudW1fY2FjaGVfbGVhdmVzID09IDAg
fHwgYy0+eDg2ID09IDE1KSAmJiBjLT5jcHVpZF9sZXZlbCA+IDEKPj4gJiYKPj4gPiArCQljLT54
ODZfdmVuZG9yICE9IFg4Nl9WRU5ET1JfU0hBTkdIQUkgKQo+PiAKPj4gVGhlIGluZGVudGF0aW9u
IGhlcmUgaXMgX3N0aWxsXyB3cm9uZyAoYW5kIHRoZXJlIGFyZSBzdHJheSBzcGFjZXMpLCBidXQg
SSdsbCB0cnkKPj4gdG8gcmVtZW1iZXIgZml4aW5nIHRoaXMgdXAgd2hlbiBjb21taXR0aW5nIChh
ZnRlciA0LjExIHdhcyBicmFuY2hlZCBvZmYpLAo+PiBpLmUuIHdpdGggdGhhdCBmaXhlZAo+IFRv
IGJlIGNvbnNpc3RlbnQgd2l0aCBjb250ZXh0LCBJIGluZGVudCB3aXRoIHR3byBUYWJzLgoKQnV0
IHR3byB0YWJzIGFyZW4ndCBjb25zaXN0ZW50IHdpdGggY29udGV4dCAtIGEgc2luZ2xlIHRhYiBh
bmQgZW5vdWdoIHNwYWNlcwp0byBwcm9wZXJseSBhbGlnbiB3aXRoIHRoZSBwcmV2aW91cyBsaW5l
IHdvdWxkIGJlLgoKPiBEbyBJIG5lZWQgdG8gc3VibWl0IG5leHQgdmVyc2lvbiBwYXRjaCB0byBy
ZXZpc2UgaXQgPwoKTm90IHN0cmljdGx5IC0gIGFzIHNhaWQsIEknbGwgdHJ5IHRvIHJlbWVtYmVy
IHRvIGNvcnJlY3QgdGhpcyB3aGlsZSBjb21taXR0aW5nLgoKPiAgVXNlIDQgc3BhY2VzIGluc3Rl
YWQgb2YgVEFCPwoKTm8uIFlvdSBzaG91bGQgbWF0Y2ggdGhlIHN0eWxlIG9mIHN1cnJvdW5kaW5n
IGNvZGUgaGVyZSwgd2hpY2ggdXNlcyBMaW51eCdlcwp3YXkgb2YgaW5kZW50aW5nLgoKSmFuCgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
