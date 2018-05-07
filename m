From: David Wang <DavidWang@zhaoxin.com>
Subject: Re: [PATCH v4] x86/cpu: Add supports for zhaoxin x86
 platform
Date: Mon, 7 May 2018 10:11:06 +0000
Message-ID: <864332c36baa428da70672c67cb6a33b@zhaoxin.com>
References: <1525657052-3871-1-git-send-email-Davidwang@zhaoxin.com>
 <5AF00D3D02000078001C118F@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=5/i4=h2=zhaoxin.com=davidwang@srs-us1.protection.inumbo.net>)
 id 1fFdWa-0006zI-Ft
 for xen-devel@lists.xenproject.org; Mon, 07 May 2018 10:37:44 +0000
In-Reply-To: <5AF00D3D02000078001C118F@prv1-mh.provo.novell.com>
Content-Language: zh-CN
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, "Fiona Li(BJ-RD)" <FionaLi@zhaoxin.com>
List-Id: xen-devel@lists.xenproject.org

Cgo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gRnJvbTogSmFuIEJldWxpY2ggPEpCZXVs
aWNoQHN1c2UuY29tPgo+IFNlbnQ6IE1vbmRheSwgTWF5IDcsIDIwMTggNDoyNCBQTQo+IFRvOiBE
YXZpZCBXYW5nIDxEYXZpZFdhbmdAemhhb3hpbi5jb20+Cj4gQ2M6IHhlbi1kZXZlbCA8eGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnPjsgRmlvbmEgTGkoQkotUkQpCj4gPEZpb25hTGlAemhh
b3hpbi5jb20+Cj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NF0geDg2L2NwdTogQWRkIHN1cHBvcnRz
IGZvciB6aGFveGluIHg4NiBwbGF0Zm9ybQo+IAo+ID4+PiBPbiAwNy4wNS4xOCBhdCAwMzozNywg
PERhdmlkd2FuZ0B6aGFveGluLmNvbT4gd3JvdGU6Cj4gPiAtLS0gYS94ZW4vYXJjaC94ODYvY3B1
L2ludGVsX2NhY2hlaW5mby5jCj4gPiArKysgYi94ZW4vYXJjaC94ODYvY3B1L2ludGVsX2NhY2hl
aW5mby5jCj4gPiBAQCAtMTc2LDcgKzE3Niw5IEBAIHVuc2lnbmVkIGludCBpbml0X2ludGVsX2Nh
Y2hlaW5mbyhzdHJ1Y3QgY3B1aW5mb194ODYKPiAqYykKPiA+ICAJICogRG9uJ3QgdXNlIGNwdWlk
MiBpZiBjcHVpZDQgaXMgc3VwcG9ydGVkLiBGb3IgUDQsIHdlIHVzZSBjcHVpZDIgZm9yCj4gPiAg
CSAqIHRyYWNlIGNhY2hlCj4gPiAgCSAqLwo+ID4gLQlpZiAoKG51bV9jYWNoZV9sZWF2ZXMgPT0g
MCB8fCBjLT54ODYgPT0gMTUpICYmIGMtPmNwdWlkX2xldmVsID4gMSkgewo+ID4gKwlpZiAoIChu
dW1fY2FjaGVfbGVhdmVzID09IDAgfHwgYy0+eDg2ID09IDE1KSAmJiBjLT5jcHVpZF9sZXZlbCA+
IDEKPiAmJgo+ID4gKwkJYy0+eDg2X3ZlbmRvciAhPSBYODZfVkVORE9SX1NIQU5HSEFJICkKPiAK
PiBUaGUgaW5kZW50YXRpb24gaGVyZSBpcyBfc3RpbGxfIHdyb25nIChhbmQgdGhlcmUgYXJlIHN0
cmF5IHNwYWNlcyksIGJ1dCBJJ2xsIHRyeQo+IHRvIHJlbWVtYmVyIGZpeGluZyB0aGlzIHVwIHdo
ZW4gY29tbWl0dGluZyAoYWZ0ZXIgNC4xMSB3YXMgYnJhbmNoZWQgb2ZmKSwKPiBpLmUuIHdpdGgg
dGhhdCBmaXhlZApUbyBiZSBjb25zaXN0ZW50IHdpdGggY29udGV4dCwgSSBpbmRlbnQgd2l0aCB0
d28gVGFicy4gIERvIEkgbmVlZCB0byBzdWJtaXQgbmV4dCB2ZXJzaW9uIHBhdGNoIHRvIHJldmlz
ZSBpdCA/ICBVc2UgNCBzcGFjZXMgaW5zdGVhZCBvZiBUQUI/ClRoYW5rIHlvdSBmb3IgeW91ciBw
YXRpZW5jZS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
