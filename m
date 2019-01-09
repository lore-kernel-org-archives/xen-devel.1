From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] tmem: default to off
Date: Wed, 09 Jan 2019 08:27:47 -0700
Message-ID: <5C3612F3020000780020BDE4@prv1-mh.provo.novell.com>
References: <5C35B94F020000780020BB36@prv1-mh.provo.novell.com>
 <1547046169812.74855@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=7QHe=PR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ghFlo-00024D-1k
 for xen-devel@lists.xenproject.org; Wed, 09 Jan 2019 15:27:52 +0000
In-Reply-To: <1547046169812.74855@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, george.dunlap@citrix.com, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson <Ian.Jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA5LjAxLjE5IGF0IDE2OjAyLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IEZyb206IFhlbi1kZXZlbCA8eGVuLWRldmVsLWJvdW5jZXNAbGlzdHMueGVucHJvamVjdC5vcmc+
IG9uIGJlaGFsZiBvZiBKYW4gQmV1bGljaCAKPiA8SkJldWxpY2hAc3VzZS5jb20+Ogo+IC0tLSBh
L3hlbi9jb21tb24vTWFrZWZpbGUKPiArKysgYi94ZW4vY29tbW9uL01ha2VmaWxlCj4gQEAgLTIx
LDcgKzIxLDcgQEAgb2JqLSQoQ09ORklHX0tFWEVDKSArPSBraW1hZ2Uubwo+ICBvYmoteSArPSBs
aWIubwo+ICBvYmotJChDT05GSUdfTkVFRFNfTElTVF9TT1JUKSArPSBsaXN0X3NvcnQubwo+ICBv
YmotJChDT05GSUdfTElWRVBBVENIKSArPSBsaXZlcGF0Y2gubyBsaXZlcGF0Y2hfZWxmLm8KPiAt
b2JqLXkgKz0gbHpvLm8KPiArb2JqLSQoQ09ORklHX1RNRU0pICs9IGx6by5vCj4gCj4gSGVyZSB5
b3UgY29tcGxldGVseSBkaXNhYmxlIHRoZSBidWlsZCBvZiBsem8gaWYgdG1lbSBpcyBub3QgZW5h
YmxlZC4KPiAKPiAgb2JqLSQoQ09ORklHX01FTV9BQ0NFU1MpICs9IG1lbV9hY2Nlc3Mubwo+ICBv
YmoteSArPSBtZW1vcnkubwo+ICBvYmoteSArPSBtb25pdG9yLm8KPiBAQCAtNjYsOCArNjYsOSBA
QCBvYmotYmluLXkgKz0gd2FybmluZy5pbml0Lm8KPiAgb2JqLSQoQ09ORklHX1hFTk9QUk9GKSAr
PSB4ZW5vcHJvZi5vCj4gIG9iai15ICs9IHhtYWxsb2NfdGxzZi5vCj4gCj4gLW9iai1iaW4tJChD
T05GSUdfWDg2KSArPSAkKGZvcmVhY2ggbixkZWNvbXByZXNzIGJ1bnppcDIgdW54eiB1bmx6bWEg
dW5sem8gCj4gdW5sejQgZWFybHljcGlvLCQobikuaW5pdC5vKQo+IC0KPiArbHpvLXkgOj0gbHpv
Cj4gK2x6by0kKENPTkZJR19UTUVNKSA6PQo+ICtvYmotYmluLSQoQ09ORklHX1g4NikgKz0gJChm
b3JlYWNoIG4sZGVjb21wcmVzcyBidW56aXAyIHVueHogdW5sem1hICQobHpvLXkpIHVubHpvIHVu
bHo0IGVhcmx5Y3BpbywkKG4pLmluaXQubykKPiAKPiBIZXJlIGhvd2V2ZXIgeW91IGFsd2F5cyBi
dWlsZCB1bmx6by5jLCB3aGljaCBBRkFJQ1QgbWFrZXMgdXNlIG9mIHRoZSAKPiBsem8xeF9kZWNv
bXByZXNzX3NhZmUgZnVuY3Rpb24gdGhhdCdzIGRlZmluZWQgaW4gbHpvLmMuCgpOb3RlIHRoZSAo
bmV3KSBkZWZpbml0aW9uIGFuZCB1c2Ugb2YgbHpvLXksIHNvIHRvZ2V0aGVyIHdpdGggdW5sem8u
aW5pdC5vCmx6by5pbml0Lm8gd2lsbCBhbHNvIGJlIGJ1aWx0LiAoSSBjYW4gYXNzdXJlIHlvdSB0
aGF0IEkgZGlkIHRlc3Qgd2l0aCBUTUVNCmVuYWJsZWQgYW5kIGRpc2FibGVkLikKCkphbgoKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
