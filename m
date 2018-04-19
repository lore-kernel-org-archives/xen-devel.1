From: Daniel Kiper <daniel.kiper@oracle.com>
Subject: Re: [PATCH v5] x86/setup: properly update PTEs if
 src/dst overlaps when relocating Xen image
Date: Thu, 19 Apr 2018 11:28:31 +0200
Message-ID: <20180419092831.GD6312@olila.local.net-space.pl>
References: <1524047217-24424-1-git-send-email-daniel.kiper@oracle.com>
 <5AD76BB502000078001BC74D@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=r1fe=hi=oracle.com=daniel.kiper@srs-us1.protection.inumbo.net>)
 id 1f95rt-0003yK-Da
 for xen-devel@lists.xenproject.org; Thu, 19 Apr 2018 09:28:41 +0000
Content-Disposition: inline
In-Reply-To: <5AD76BB502000078001BC74D@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBBcHIgMTgsIDIwMTggYXQgMTA6MDA6NTNBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDE4LjA0LjE4IGF0IDEyOjI2LCA8ZGFuaWVsLmtpcGVyQG9yYWNsZS5jb20+
IHdyb3RlOgo+ID4gQEAgLTEwMTksNiArMTAyMCwxMiBAQCB2b2lkIF9faW5pdCBub3JldHVybiBf
X3N0YXJ0X3hlbih1bnNpZ25lZCBsb25nIG1iaV9wKQo+ID4gICAgICAgICAgICAgIGJvb3RzeW0o
dHJhbXBvbGluZV94ZW5fcGh5c19zdGFydCkgPSBlOwo+ID4KPiA+ICAgICAgICAgICAgICAvKgo+
ID4gKyAgICAgICAgICAgICAqIEFsbCBQVEVzIHdpdGggUEZOcyBhYm92ZSBwdGVfdXBkYXRlX2xp
bWl0Cj4gPiArICAgICAgICAgICAgICogd2VyZSB1cGRhdGVkIGVhcmxpZXIuIFNraXAgdGhlbS4K
PiA+ICsgICAgICAgICAgICAgKi8KPiA+ICsgICAgICAgICAgICBwdGVfdXBkYXRlX2xpbWl0ID0g
UEZOX0RPV04oZSArIFhFTl9JTUdfT0ZGU0VUKTsKPgo+IEkgZG9uJ3QgdW5kZXJzdGFuZCB0aGUg
Y29tbWVudDogTm8gUFRFIHVwZGF0ZXMgaGFwcGVuIGJlZm9yZSB0aGlzIHBvaW50Cj4gYWZhaWN0
LiBJdCBpcyBqdXN0IHRoYXQgUFRFcyBwb2ludGluZyBhYm92ZSB0aGF0IGFkZHJlc3MgYXJlIG5v
dCBjYW5kaWRhdGVzCj4gZm9yIHJlbG9jYXRpb24uIEkgdGhpbmsgdGhlIGNvbW1lbnQgc2hvdWxk
IGF0IGxlYXN0IG1lbnRpb24gdGhlIG92ZXJsYXAKPiBzY2VuYXJpbyB5b3VyIHRyeWluZyB0byBk
ZWFsIHdpdGgsIHdpdGggdGhlIGltcG9ydGFudCBwb2ludCBiZWluZyB0aGF0IHRoZXJlCj4gbWF5
IGFjdHVhbGx5IGJlIFBURXMgcG9pbnRpbmcgaW50byBbZSwgZSArIFhFTl9JTUdfT0ZGU0VUKS4K
CldoYXQgZG8geW91IHRoaW5rIGFib3V0IHRoYXQ6CgogIEFsbCBQVEVzIHBvaW50aW5nIGFib3Zl
IHRoYXQgYWRkcmVzcyBhcmUgbm90IGNhbmRpZGF0ZXMgZm9yIHJlbG9jYXRpb24uCiAgRHVlIHRv
IHBvc3NpYmlsaXR5IG9mIHBhcnRpYWwgb3ZlcmxhcCBvZiB0aGUgZW5kIG9mIHNvdXJjZSBpbWFn
ZSBhbmQgdGhlCiAgYmVnaW5uaW5nIG9mIHJlZ2lvbiBmb3IgZGVzdGluYXRpb24gaW1hZ2Ugc29t
ZSBQVEVzIG1heSBwb2ludCB0bwogIGFkZHJlc3NlcyBpbiByYW5nZSBbZSwgZSArIFhFTl9JTUdf
T0ZGU0VUKS4KCj4gVGhlIGFjdHVhbCBjb2RlIGFkanVzdG1lbnRzIGxvb2sgZmluZSB0byBtZSBu
b3csIGFsYmVpdCBJIHdvbmRlciB3aGV0aGVyCj4gPj0gd291bGRuJ3QgYmUgbW9yZSBhcHByb3By
aWF0ZSB0byB1c2UuCgpZb3UgYXJlIHJpZ2h0LiBDdXJyZW50bHkgZmlyc3QgMiBNaUIgbWFwcGlu
ZyBvZiB0aGUgaW1hZ2UsIGluIHRoZSB3b3JzdCBjYXNlLApjYW4gYmUgcmVsb2NhdGVkIHR3aWNl
LiBJIHdpbGwgZml4IHRoaXMuCgpEYW5pZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
