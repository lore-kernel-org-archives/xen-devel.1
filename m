From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH 07/25] xen (ARM,
 x86): add errno-returning functions for copy
Date: Wed, 12 Dec 2018 17:01:49 +0100
Message-ID: <20181212160149.aoaevnf66q72oa7k@mac>
References: <1543627984-21394-1-git-send-email-christopher.w.clark@gmail.com>
 <1543627984-21394-8-git-send-email-christopher.w.clark@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9xWB=OV=citrix.com=prvs=87720dd39=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gX6z8-0007rz-R1
 for xen-devel@lists.xenproject.org; Wed, 12 Dec 2018 16:03:42 +0000
Content-Disposition: inline
In-Reply-To: <1543627984-21394-8-git-send-email-christopher.w.clark@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, James McKenzie <voreekf@madingley.org>, Ross Philipson <ross.philipson@gmail.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jason Andryuk <jandryuk@gmail.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Rich Persaud <persaur@gmail.com>, Tim Deegan <tim@xen.org>, Daniel Smith <dpsmith@apertussolutions.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org, Eric Chanudet <eric.chanudet@gmail.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBOb3YgMzAsIDIwMTggYXQgMDU6MzI6NDZQTSAtMDgwMCwgQ2hyaXN0b3BoZXIgQ2xh
cmsgd3JvdGU6Cj4gQXBwbGllZCB0byBib3RoIHg4NiBhbmQgQVJNIGhlYWRlcnMuCj4gCj4gU2ln
bmVkLW9mZi1ieTogQ2hyaXN0b3BoZXIgQ2xhcmsgPGNocmlzdG9waGVyLmNsYXJrNkBiYWVzeXN0
ZW1zLmNvbT4KPiAtLS0KPiAgeGVuL2luY2x1ZGUvYXNtLWFybS9ndWVzdF9hY2Nlc3MuaCB8IDI1
ICsrKysrKysrKysrKysrKysrKysrKysrKysKPiAgeGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVzdF9h
Y2Nlc3MuaCB8IDI5ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIHhlbi9pbmNsdWRl
L3hlbi9ndWVzdF9hY2Nlc3MuaCAgICAgfCAgMyArKysKPiAgMyBmaWxlcyBjaGFuZ2VkLCA1NyBp
bnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vZ3Vlc3Rf
YWNjZXNzLmggYi94ZW4vaW5jbHVkZS9hc20tYXJtL2d1ZXN0X2FjY2Vzcy5oCj4gaW5kZXggMjI0
ZDJhMC4uN2I2Zjg5YyAxMDA2NDQKPiAtLS0gYS94ZW4vaW5jbHVkZS9hc20tYXJtL2d1ZXN0X2Fj
Y2Vzcy5oCj4gKysrIGIveGVuL2luY2x1ZGUvYXNtLWFybS9ndWVzdF9hY2Nlc3MuaAo+IEBAIC0y
NCw2ICsyNCwxMSBAQCBpbnQgYWNjZXNzX2d1ZXN0X21lbW9yeV9ieV9pcGEoc3RydWN0IGRvbWFp
biAqZCwgcGFkZHJfdCBpcGEsIHZvaWQgKmJ1ZiwKPiAgI2RlZmluZSBfX3Jhd19jb3B5X2Zyb21f
Z3Vlc3QgcmF3X2NvcHlfZnJvbV9ndWVzdAo+ICAjZGVmaW5lIF9fcmF3X2NsZWFyX2d1ZXN0IHJh
d19jbGVhcl9ndWVzdAo+ICAKPiArI2RlZmluZSByYXdfY29weV9mcm9tX2d1ZXN0X2Vycm5vKGRz
dCwgc3JjLCBsZW4pICAgICAgICAgICAgIFwKPiArICAgIChyYXdfY29weV9mcm9tX2d1ZXN0KChk
c3QpLCAoc3JjKSwgKGxlbikpID8gLUVGQVVMVCA6IDApCj4gKyNkZWZpbmUgcmF3X2NvcHlfdG9f
Z3Vlc3RfZXJybm8oZHN0LCBzcmMsIGxlbikgICAgICAgICAgICAgICBcCj4gKyAgICAocmF3X2Nv
cHlfdG9fZ3Vlc3QoKGRzdCksIChzcmMpLCAobGVuKSkgPyAtRUZBVUxUIDogMCkKClNpbmNlIHRo
ZSBvbmx5IGVycm9yIHRoYXQgeW91IHJldHVybiBpcyBFRkFVTFQsIEkgZG9uJ3QgcmVhbGx5IHNl
ZSB0aGUKcG9pbnQgaW4gYWRkaW5nIGFsbCB0aG9zZSBoZWxwZXJzLiBZb3UgYWNoaWV2ZSBleGFj
dGx5IHRoZSBzYW1lIGJ5CnJldHVybmluZyBhIGJvb2xlYW4gYW5kIGRvaW5nIHRoZSB0cmFuc2xh
dGlvbiB0byBFRkFVTFQgaW4gdGhlIGNhbGxlcgppZiByZXF1aXJlZC4KCkl0IG1pZ2h0IGhhdmUg
YmVlbiBuaWNlIHRvIGhhdmUgdGhlIGNvcHkgdG8vZnJvbSBzZXQgb2YgZnVuY3Rpb25zCnJldHVy
biBhbiBlcnJvciB2YWx1ZSwgYnV0IGFkZGluZyBhIG5ldyBzZXQgb2YgaGVscGVycyB0aGF0IGhh
dmUgdGhlCnNhbWUgZnVuY3Rpb25hbGl0eSBidXQganVzdCBkaWZmZXIgaW4gdGhlIHJldHVybiB2
YWx1ZSBsb29rCnJlZHVuZGFudC4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
