From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v3 7/7] amd/pvh: enable ACPI C1E disable
 quirk on PVH Dom0
Date: Wed, 7 Nov 2018 11:24:21 +0100
Message-ID: <20181107102421.hqv6hj52lic4hggu@mac.citrite.net>
References: <20181030154123.4218-1-roger.pau@citrix.com>
 <20181030154123.4218-8-roger.pau@citrix.com>
 <5BDC13B202000078001F7174@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=kqzb=ns=citrix.com=prvs=842e1f2a3=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gKL0l-0008Px-OQ
 for xen-devel@lists.xenproject.org; Wed, 07 Nov 2018 10:24:35 +0000
Content-Disposition: inline
In-Reply-To: <5BDC13B202000078001F7174@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Brian Woods <brian.woods@amd.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBOb3YgMDIsIDIwMTggYXQgMDM6MDY6NThBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDMwLjEwLjE4IGF0IDE2OjQxLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gLS0tIGEveGVuL2FyY2gveDg2L2NwdS9hbWQuYwo+ID4gKysrIGIveGVuL2FyY2gv
eDg2L2NwdS9hbWQuYwo+ID4gQEAgLTQ0LDYgKzQ0LDkgQEAgaW50ZWdlcl9wYXJhbSgiY3B1aWRf
bWFza190aGVybWFsX2VjeCIsIG9wdF9jcHVpZF9tYXNrX3RoZXJtYWxfZWN4KTsKPiA+ICBzOCBf
X3JlYWRfbW9zdGx5IG9wdF9hbGxvd191bnNhZmU7Cj4gPiAgYm9vbGVhbl9wYXJhbSgiYWxsb3df
dW5zYWZlIiwgb3B0X2FsbG93X3Vuc2FmZSk7Cj4gPiAgCj4gPiArLyogU2lnbmFsIHdoZXRoZXIg
dGhlIEFDUEkgQzFFIHF1aXJrIGlzIHJlcXVpcmVkLiAqLwo+ID4gK2Jvb2wgYW1kX2FjcGlfYzFl
X3F1aXJrOwo+IAo+IF9fcmVhZF9tb3N0bHkKPiAKPiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0v
c3ZtL3N2bS5jCj4gPiArKysgYi94ZW4vYXJjaC94ODYvaHZtL3N2bS9zdm0uYwo+ID4gQEAgLTEy
NzMsNiArMTI3MywyNCBAQCB2b2lkIHN2bV9ob3N0X29zdndfaW5pdCgpCj4gPiAgICAgIHNwaW5f
dW5sb2NrKCZvc3Z3X2xvY2spOwo+ID4gIH0KPiA+ICAKPiA+ICtzdGF0aWMgaW50IGFjcGlfYzFl
X3F1aXJrKGludCBkaXIsIHVuc2lnbmVkIGludCBwb3J0LCB1bnNpZ25lZCBpbnQgYnl0ZXMsCj4g
PiArICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50MzJfdCAqdmFsKQo+ID4gK3sKPiA+ICsg
ICAgQVNTRVJUKGJ5dGVzID09IDEgJiYgcG9ydCA9PSBhY3BpX3NtaV9jbWQpOwo+ID4gKwo+ID4g
KyAgICBpZiAoIGRpciA9PSBJT1JFUV9SRUFEICkKPiA+ICsgICAgewo+ID4gKyAgICAgICAgKnZh
bCA9IGluYihwb3J0KTsKPiA+ICsgICAgICAgIHJldHVybiBYODZFTVVMX09LQVk7Cj4gPiArICAg
IH0KPiA+ICsKPiA+ICsgICAgb3V0YigqdmFsLCBwb3J0KTsKPiA+ICsgICAgaWYgKCAqdmFsID09
IGFjcGlfZW5hYmxlX3ZhbHVlICkKPiA+ICsgICAgICAgb25fZWFjaF9jcHUoYW1kX2Rpc2FibGVf
YzFlLCBOVUxMLCAxKTsKPiA+ICsKPiA+ICsgICAgcmV0dXJuIFg4NkVNVUxfT0tBWTsKPiA+ICt9
Cj4gCj4gSSB0aGluayB5b3UgY291bGQgZG8gd2l0aCBldmVuIGxlc3MgbG9naWMgZHVwbGljYXRp
b24gaWYgaW5zdGVhZCB5b3UKPiBjYWxsZWQgY2hlY2tfZGlzYWJsZV9jMWUoKSAodGhlbiBnaXZl
biBhbiBhbWRfIHByZWZpeCBvZiBjb3Vyc2UpCj4gaGVyZS4gSSdkIHRoZW4gZnVydGhlciBjb25z
aWRlciB0byBkbyBhd2F5IHdpdGgKPiBwdl9wb3N0X291dGJfaG9vayBpbiBhIGZvbGxvdy11cCBw
YXRjaCwgZ2V0dGluZyB0aGUgUFYgc2lkZQo+IGNsb3NlciB0byB0aGUgbW9kZWwgdXNlZCBoZXJl
LgoKVXNpbmcgY2hlY2tfZGlzYWJsZV9jMWUgaW5jdXJzIGluIG9uZSBleHRyYSBjaGVjayB0aGF0
J3Mgbm90IG5lZWRlZApoZXJlLCBzaW5jZSB0aGUgcG9ydCB3aWxsIGFsd2F5cyBiZSBhY3BpX3Nt
aV9jbWQgaW4gYWNwaV9jMWVfcXVpcmsuCkluIGFueSBjYXNlIEkgYWdyZWUgaXQncyBiZXR0ZXIg
dG8gdXNlIGNoZWNrX2Rpc2FibGVfYzFlIHNvIHRoZXJlJ3MKc2xpZ2h0bHkgbGVzcyBjb2RlIHJl
cGV0aXRpb24uCgo+IAo+IE5vdCBiZWluZyB0aGUgbWFpbnRhaW5lciBvZiB0aGlzIGNvZGUsIEkn
ZCBuZXZlcnRoZWxlc3MgbGlrZSB0byBhbHNvCj4gc3VnZ2VzdCB0byB1c2UgaWYvZWxzZSBoZXJl
LCBtYWtpbmcgdGhlIGZ1bmN0aW9uIGdldCBhd2F5IHdpdGgKPiBqdXN0IGEgc2luZ2xlIHJldHVy
biBwb2ludC4KCkFjaywgd2lsbCByZXNlbmQgd2l0aCB0aGUgZml4ZXMuCgpUaGFua3MsIFJvZ2Vy
LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
