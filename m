From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v7 for-next 10/12] vpci/msi: add MSI handlers
Date: Mon, 22 Jan 2018 05:58:24 -0700
Message-ID: <5A65EE0002000078001A1146@prv-mh.provo.novell.com>
References: <20171018114034.36587-1-roger.pau@citrix.com>
 <20171018114034.36587-11-roger.pau@citrix.com>
 <5A33C8FA0200007800197AC4@prv-mh.provo.novell.com>
 <20180122124824.wdqgirhi2avsxaxy@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=cwx6=er=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1edbgE-000468-Pe
 for xen-devel@lists.xenproject.org; Mon, 22 Jan 2018 12:58:30 +0000
In-Reply-To: <20180122124824.wdqgirhi2avsxaxy@MacBook-Pro-de-Roger.local>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, boris.ostrovsky@oracle.com, Paul Durrant <paul.durrant@citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIyLjAxLjE4IGF0IDEzOjQ4LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IEkgdGhpbmsgdGhlIHByb3BlciB3YXkgdG8gc29sdmUgdGhpcyBpcyB0byByZXNldCB0aGUgbWFz
ayBiaXRzIHRvCj4gbWFza2VkIHdoZW4gdGhlIHZlY3RvciBpcyB1bmJvdW5kLCBzbyB0aGF0IGF0
IGJpbmQgdGltZSB0aGUgc3RhdGUgb2YKPiB0aGUgbWFzayBpcyBjb25zaXN0ZW50IHJlZ2FyZGxl
c3Mgb2Ygd2hldGhlciB0aGUgdmVjdG9yIGhhcyBiZWVuCj4gcHJldmlvdXNseSBib3VuZCBvciBu
b3QuIFRoZSBmb2xsb3dpbmcgcGF0Y2ggc2hvdWxkIGZpeCB0aGlzOgo+IAo+IGRpZmYgLS1naXQg
YS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9pby5jIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gv
aW8uYwo+IGluZGV4IDhmMTZlNmMwYTUuLmJhYjNhYTM0OWEgMTAwNjQ0Cj4gLS0tIGEveGVuL2Ry
aXZlcnMvcGFzc3Rocm91Z2gvaW8uYwo+ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2lv
LmMKPiBAQCAtNjQ1LDcgKzY0NSwyMiBAQCBpbnQgcHRfaXJxX2Rlc3Ryb3lfYmluZCgKPiAgICAg
ICAgICB9Cj4gICAgICAgICAgYnJlYWs7Cj4gICAgICBjYXNlIFBUX0lSUV9UWVBFX01TSToKPiAr
ICAgIHsKPiArICAgICAgICB1bnNpZ25lZCBsb25nIGZsYWdzOwo+ICsgICAgICAgIHN0cnVjdCBp
cnFfZGVzYyAqZGVzYyA9IGRvbWFpbl9zcGluX2xvY2tfaXJxX2Rlc2MoZCwgbWFjaGluZV9nc2ks
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAmZmxhZ3MpOwo+ICsKPiArICAgICAgICBpZiAoICFkZXNjICkKPiArICAgICAgICAgICAg
cmV0dXJuIC1FSU5WQUw7Cj4gKyAgICAgICAgLyoKPiArICAgICAgICAgKiBMZWF2ZSB0aGUgTVNJ
IG1hc2tlZCwgc28gdGhhdCB0aGUgc3RhdGUgd2hlbiBjYWxsaW5nCj4gKyAgICAgICAgICogcHRf
aXJxX2NyZWF0ZV9iaW5kIGlzIGNvbnNpc3RlbnQgYWNyb3NzIGJpbmQvdW5iaW5kcy4KPiArICAg
ICAgICAgKi8KPiArICAgICAgICBndWVzdF9tYXNrX21zaV9pcnEoZGVzYywgdHJ1ZSk7Cj4gKyAg
ICAgICAgc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmZGVzYy0+bG9jaywgZmxhZ3MpOwo+ICAgICAg
ICAgIGJyZWFrOwo+ICsgICAgfQo+ICsKPiAgICAgIGRlZmF1bHQ6Cj4gICAgICAgICAgcmV0dXJu
IC1FT1BOT1RTVVBQOwo+ICAgICAgfQo+IAo+IEkgdGhpbmsgdGhpcyBzaG91bGQgYmUgc2VuZCBh
cyBhIHNlcGFyYXRlIHBhdGNoIG9mIHRoaXMgc2VyaWVzLCBzaW5jZQo+IGl0J3MgYSBmaXggZm9y
IHB0X2lycV9kZXN0cm95X2JpbmQuCgpMb29rcyBwbGF1c2libGUsIGJ1dCBJJ2xsIGRlZmVyIG15
IGFjayB1bnRpbCBJJ3ZlIGFsc28gc2VlbiB0aGUKZGVzY3JpcHRpb24gZm9yIGl0LCBiZWNhdXNl
IGlmIHRoZSBhYm92ZSBpcyByZWFsbHkgbmVjZXNzYXJ5IEknZApzb3J0IG9mIGV4cGVjdCB0aGVy
ZSB0byBiZSBhbiBhY3R1YWwgaXNzdWUgd2l0aG91dCBhbnkgb2YgeW91cgpzZXJpZXMgYXBwbGll
ZC4KCkphbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
