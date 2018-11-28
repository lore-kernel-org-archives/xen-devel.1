From: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH for-3.2 v4 15/28] hw: apply accel compat
 properties without touching globals
Date: Wed, 28 Nov 2018 18:49:33 +0100
Message-ID: <20181128184933.66391782@redhat.com>
References: <20181127092801.21777-1-marcandre.lureau@redhat.com>
 <20181127092801.21777-16-marcandre.lureau@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=mek4=oh=redhat.com=imammedo@srs-us1.protection.inumbo.net>)
 id 1gS3xz-0007y1-TX
 for xen-devel@lists.xenproject.org; Wed, 28 Nov 2018 17:49:39 +0000
In-Reply-To: <20181127092801.21777-16-marcandre.lureau@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, qemu-devel@nongnu.org, "open list:X86" <xen-devel@lists.xenproject.org>, Anthony Perard <anthony.perard@citrix.com>, Paolo Bonzini <pbonzini@redhat.com>, Andreas =?UTF-8?B?RsOkcmJl?= =?UTF-8?B?cg==?= <afaerber@suse.de>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCAyNyBOb3YgMjAxOCAxMzoyNzo0OCArMDQwMApNYXJjLUFuZHLDqSBMdXJlYXUgPG1h
cmNhbmRyZS5sdXJlYXVAcmVkaGF0LmNvbT4gd3JvdGU6Cgo+IEludHJvZHVjZSBvYmplY3RfYXBw
bHlfZ2xvYmFsX3Byb3BzKCkgZnVuY3Rpb24sIHRvIGFwcGx5IGNvbXBhdGliaWxpdHkKPiBwcm9w
ZXJ0aWVzIGZyb20gYSBHUHRyQXJyYXkuCj4gCj4gRm9yIGFjY2VsIGNvbXBhdGliaWxpdHkgcHJv
cGVydGllcywgYXBwbHkgdGhlbSBkdXJpbmcKPiBkZXZpY2VfcG9zdF9pbml0KCksIGFmdGVyIGFj
Y2VsX3JlZ2lzdGVyX2NvbXBhdF9wcm9wcygpIGhhcyBzZXQgdGhlbS4KPiAKPiBUbyBwb3B1bGF0
ZSB0aGUgY29tcGF0aWJpbGl0eSBwcm9wZXJ0aWVzLCBpbnRyb2R1Y2UgU0VUX0NPTVBBVCgpLCBh
Cj4gbW9yZSBnZW5lcmljIHZlcnNpb24gb2YgU0VUX01BQ0hJTkVfQ09NUEFUKCkgdGhhdCBjYW4g
c2V0IGNvbXBhdAo+IHByb3BlcnRpZXMgb24gb3RoZXIgb2JqZWN0cyB0aGFuIE1hY2hpbmUsIGFu
ZCB1c2luZyBHUHRyQXJyYXkuCj4gCj4gU2lnbmVkLW9mZi1ieTogTWFyYy1BbmRyw6kgTHVyZWF1
IDxtYXJjYW5kcmUubHVyZWF1QHJlZGhhdC5jb20+Cj4gLS0tCj4gIGluY2x1ZGUvaHcvcWRldi1j
b3JlLmggfCAxMyArKysrKysrKysrKysrCj4gIGluY2x1ZGUvcW9tL29iamVjdC5oICAgfCAgMyAr
KysKPiAgaW5jbHVkZS9zeXNlbXUvYWNjZWwuaCB8ICA0ICstLS0KPiAgYWNjZWwvYWNjZWwuYyAg
ICAgICAgICB8IDEyIC0tLS0tLS0tLS0tLQo+ICBody9jb3JlL3FkZXYuYyAgICAgICAgIHwgMTEg
KysrKysrKysrKysKPiAgaHcveGVuL3hlbi1jb21tb24uYyAgICB8IDM4ICsrKysrKysrKysrKysr
KysrKystLS0tLS0tLS0tLS0tLS0tLS0tCj4gIHFvbS9vYmplY3QuYyAgICAgICAgICAgfCAyNSAr
KysrKysrKysrKysrKysrKysrKysrKysrCj4gIHZsLmMgICAgICAgICAgICAgICAgICAgfCAgMiAr
LQo+ICA4IGZpbGVzIGNoYW5nZWQsIDczIGluc2VydGlvbnMoKyksIDM1IGRlbGV0aW9ucygtKQo+
IApbLi4uXQoKPiBkaWZmIC0tZ2l0IGEvdmwuYyBiL3ZsLmMKPiBpbmRleCBmYTI1ZDFhZTJkLi5j
MDZlOTQyNzFjIDEwMDY0NAo+IC0tLSBhL3ZsLmMKPiArKysgYi92bC5jCj4gQEAgLTI5NjMsNyAr
Mjk2Myw3IEBAIHN0YXRpYyB2b2lkIHVzZXJfcmVnaXN0ZXJfZ2xvYmFsX3Byb3BzKHZvaWQpCj4g
ICAqLwo+ICBzdGF0aWMgdm9pZCByZWdpc3Rlcl9nbG9iYWxfcHJvcGVydGllcyhNYWNoaW5lU3Rh
dGUgKm1zKQo+ICB7Cj4gLSAgICBhY2NlbF9yZWdpc3Rlcl9jb21wYXRfcHJvcHMobXMtPmFjY2Vs
ZXJhdG9yKTsKPiArICAgIGFjY2VsX3JlZ2lzdGVyX2NvbXBhdF9wcm9wcyhBQ0NFTF9HRVRfQ0xB
U1MobXMtPmFjY2VsZXJhdG9yKS0+Y29tcGF0X3Byb3BzKTsKICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBeXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eCkFjY2VwdGFi
bGUgd2F5IHRvIGRvIGFib3ZlIGlzOgogRm9vICpmb28gPUNBU1Qoc29tZXRoaW5nKQogRlVOQyhm
b28tPm1lbWJlcikKaWYgSSByZWNhbGwgY29ycmVjdGx5Cgo+ICAgICAgbWFjaGluZV9yZWdpc3Rl
cl9jb21wYXRfcHJvcHMobXMpOwo+ICAgICAgdXNlcl9yZWdpc3Rlcl9nbG9iYWxfcHJvcHMoKTsK
PiAgfQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
