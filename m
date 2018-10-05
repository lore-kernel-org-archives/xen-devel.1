From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86: don't build guest-walk code without
 HVM and SHADOW_PAGING
Date: Fri, 5 Oct 2018 11:32:48 +0100
Message-ID: <e31ed1a4-509c-a51c-3315-244ba0150107@citrix.com>
References: <5BB73B0502000078001EEBB6@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=wiz4=mr=citrix.com=prvs=8095139d5=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1g8NPi-0001Ry-Q8
 for xen-devel@lists.xenproject.org; Fri, 05 Oct 2018 10:32:54 +0000
In-Reply-To: <5BB73B0502000078001EEBB6@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDUvMTAvMTggMTE6MjAsIEphbiBCZXVsaWNoIHdyb3RlOgo+IEl0J3MgZGVhZCBjb2RlIGlu
IHRoYXQgY2FzZS4KPgo+IFdlIGNvdWxkIGdvIGZ1cnRoZXIsIGFzIHdlIGRvbid0IHJlYWxseSBu
ZWVkIHRoZSAyLSBhbmQgMy1sZXZlbCB3YWxrCj4gY29kZSBpbiBQViBtb2RlLCBidXQgdG8gZHJv
cCB0aGVpciBjb21waWxhdGlvbiByZXF1aXJlcyBxdWl0ZSBhIGJpdCBvZgo+IGRpc2VudGFuZ2xp
bmcgb2Ygc2hhZG93IG1vZGUgY29kZS4KPgo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxq
YmV1bGljaEBzdXNlLmNvbT4KPgo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9tbS9NYWtlZmlsZQo+ICsr
KyBiL3hlbi9hcmNoL3g4Ni9tbS9NYWtlZmlsZQo+IEBAIC0yLDkgKzIsOCBAQCBzdWJkaXIteSAr
PSBzaGFkb3cKPiAgc3ViZGlyLSQoQ09ORklHX0hWTSkgKz0gaGFwCj4gIAo+ICBvYmotJChDT05G
SUdfSFZNKSArPSBhbHRwMm0ubwo+IC1vYmoteSArPSBndWVzdF93YWxrXzIubwo+IC1vYmoteSAr
PSBndWVzdF93YWxrXzMubwo+IC1vYmoteSArPSBndWVzdF93YWxrXzQubwo+ICtvYmotJChDT05G
SUdfSFZNKSArPSBndWVzdF93YWxrXzIubyBndWVzdF93YWxrXzMubyBndWVzdF93YWxrXzQubwo+
ICtvYmotJChDT05GSUdfU0hBRE9XX1BBR0lORykgKz0gZ3Vlc3Rfd2Fsa18yLm8gZ3Vlc3Rfd2Fs
a18zLm8gZ3Vlc3Rfd2Fsa180Lm8KPiAgb2JqLSQoQ09ORklHX01FTV9BQ0NFU1MpICs9IG1lbV9h
Y2Nlc3Mubwo+ICBvYmoteSArPSBtZW1fcGFnaW5nLm8KPiAgb2JqLXkgKz0gbWVtX3NoYXJpbmcu
bwoKSSdtIGZpbmUgd2l0aCB0aGUgY2hhbmdlIGluIHByaW5jaXBsZS7CoCBIb3cgYWJvdXQKCm9i
ai1ndyA6PSBndWVzdF93YWxrXzIubyBndWVzdF93YWxrXzMubyBndWVzdF93YWxrXzQubwoKb2Jq
LSQoQ09ORklHX0hWTSkgKz0gb2JqLWd3Cm9iai0kKENPTkZJR19TSEFET1dfUEFHSU5HKSArPSBv
YmotZ3cKCnRvIGF2b2lkIGR1cGxpY2F0aW5nIHRoZSBndWVzdF93YWxrKiBsaXN0PwoKRWl0aGVy
IHdheSwgQWNrZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+
Cgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
