From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v5] x86/setup: properly update PTEs if
 src/dst overlaps when relocating Xen image
Date: Thu, 19 Apr 2018 06:05:37 -0600
Message-ID: <5AD8861102000078001BCA85@prv1-mh.provo.novell.com>
References: <1524047217-24424-1-git-send-email-daniel.kiper@oracle.com>
 <5AD76BB502000078001BC74D@prv1-mh.provo.novell.com>
 <20180419092831.GD6312@olila.local.net-space.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=nblc=hi=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1f98Jl-0007UK-Pv
 for xen-devel@lists.xenproject.org; Thu, 19 Apr 2018 12:05:37 +0000
In-Reply-To: <20180419092831.GD6312@olila.local.net-space.pl>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Daniel Kiper <daniel.kiper@oracle.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE5LjA0LjE4IGF0IDExOjI4LCA8ZGFuaWVsLmtpcGVyQG9yYWNsZS5jb20+IHdyb3Rl
Ogo+IE9uIFdlZCwgQXByIDE4LCAyMDE4IGF0IDEwOjAwOjUzQU0gLTA2MDAsIEphbiBCZXVsaWNo
IHdyb3RlOgo+PiA+Pj4gT24gMTguMDQuMTggYXQgMTI6MjYsIDxkYW5pZWwua2lwZXJAb3JhY2xl
LmNvbT4gd3JvdGU6Cj4+ID4gQEAgLTEwMTksNiArMTAyMCwxMiBAQCB2b2lkIF9faW5pdCBub3Jl
dHVybiBfX3N0YXJ0X3hlbih1bnNpZ25lZCBsb25nIG1iaV9wKQo+PiA+ICAgICAgICAgICAgICBi
b290c3ltKHRyYW1wb2xpbmVfeGVuX3BoeXNfc3RhcnQpID0gZTsKPj4gPgo+PiA+ICAgICAgICAg
ICAgICAvKgo+PiA+ICsgICAgICAgICAgICAgKiBBbGwgUFRFcyB3aXRoIFBGTnMgYWJvdmUgcHRl
X3VwZGF0ZV9saW1pdAo+PiA+ICsgICAgICAgICAgICAgKiB3ZXJlIHVwZGF0ZWQgZWFybGllci4g
U2tpcCB0aGVtLgo+PiA+ICsgICAgICAgICAgICAgKi8KPj4gPiArICAgICAgICAgICAgcHRlX3Vw
ZGF0ZV9saW1pdCA9IFBGTl9ET1dOKGUgKyBYRU5fSU1HX09GRlNFVCk7Cj4+Cj4+IEkgZG9uJ3Qg
dW5kZXJzdGFuZCB0aGUgY29tbWVudDogTm8gUFRFIHVwZGF0ZXMgaGFwcGVuIGJlZm9yZSB0aGlz
IHBvaW50Cj4+IGFmYWljdC4gSXQgaXMganVzdCB0aGF0IFBURXMgcG9pbnRpbmcgYWJvdmUgdGhh
dCBhZGRyZXNzIGFyZSBub3QgY2FuZGlkYXRlcwo+PiBmb3IgcmVsb2NhdGlvbi4gSSB0aGluayB0
aGUgY29tbWVudCBzaG91bGQgYXQgbGVhc3QgbWVudGlvbiB0aGUgb3ZlcmxhcAo+PiBzY2VuYXJp
byB5b3VyIHRyeWluZyB0byBkZWFsIHdpdGgsIHdpdGggdGhlIGltcG9ydGFudCBwb2ludCBiZWlu
ZyB0aGF0IHRoZXJlCj4+IG1heSBhY3R1YWxseSBiZSBQVEVzIHBvaW50aW5nIGludG8gW2UsIGUg
KyBYRU5fSU1HX09GRlNFVCkuCj4gCj4gV2hhdCBkbyB5b3UgdGhpbmsgYWJvdXQgdGhhdDoKPiAK
PiAgIEFsbCBQVEVzIHBvaW50aW5nIGFib3ZlIHRoYXQgYWRkcmVzcyBhcmUgbm90IGNhbmRpZGF0
ZXMgZm9yIHJlbG9jYXRpb24uCj4gICBEdWUgdG8gcG9zc2liaWxpdHkgb2YgcGFydGlhbCBvdmVy
bGFwIG9mIHRoZSBlbmQgb2Ygc291cmNlIGltYWdlIGFuZCB0aGUKPiAgIGJlZ2lubmluZyBvZiBy
ZWdpb24gZm9yIGRlc3RpbmF0aW9uIGltYWdlIHNvbWUgUFRFcyBtYXkgcG9pbnQgdG8KPiAgIGFk
ZHJlc3NlcyBpbiByYW5nZSBbZSwgZSArIFhFTl9JTUdfT0ZGU0VUKS4KClNHVE0uCgpKYW4KCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
