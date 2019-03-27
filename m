From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 2/6] xen: add helper for calling
 notifier_call_chain() to common/cpu.c
Date: Wed, 27 Mar 2019 17:05:06 +0100
Message-ID: <02fbc23c-b7db-5595-829d-b79e561e76db@suse.com>
References: <20190318131155.29450-1-jgross@suse.com>
 <20190318131155.29450-3-jgross@suse.com>
 <442ec458-d00e-251f-e206-d6d392f334ed@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=BLRb=R6=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1h9B39-0003Hk-Jn
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2019 16:05:11 +0000
In-Reply-To: <442ec458-d00e-251f-e206-d6d392f334ed@citrix.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjcvMDMvMjAxOSAxNjozOSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAxOC8wMy8yMDE5
IDEzOjExLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+PiBBZGQgYSBoZWxwZXIgY3B1X25vdGlmaWVy
X2NhbGxfY2hhaW4oKSB0byBjYWxsIG5vdGlmaWVyX2NhbGxfY2hhaW4oKQo+PiBmb3IgYSBjcHUg
d2l0aCBhIHNwZWNpZmllZCBhY3Rpb24sIHJldHVybmluZyBhbiBlcnJubyB2YWx1ZS4KPj4KPj4g
VGhpcyBhdm9pZHMgY29kaW5nIHRoZSBzYW1lIHBhdHRlcm4gbXVsdGlwbGUgdGltZXMuCj4+Cj4+
IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KPj4gLS0tCj4+
ICB4ZW4vY29tbW9uL2NwdS5jIHwgNTAgKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0KPj4gIDEgZmlsZSBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspLCAy
OSBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vY3B1LmMgYi94ZW4v
Y29tbW9uL2NwdS5jCj4+IGluZGV4IDgzNmM2MmY5N2YuLmM0MzZjMGRlN2YgMTAwNjQ0Cj4+IC0t
LSBhL3hlbi9jb21tb24vY3B1LmMKPj4gKysrIGIveGVuL2NvbW1vbi9jcHUuYwo+PiBAQCAtNzEs
MTEgKzcxLDE4IEBAIHZvaWQgX19pbml0IHJlZ2lzdGVyX2NwdV9ub3RpZmllcihzdHJ1Y3Qgbm90
aWZpZXJfYmxvY2sgKm5iKQo+PiAgICAgIHNwaW5fdW5sb2NrKCZjcHVfYWRkX3JlbW92ZV9sb2Nr
KTsKPj4gIH0KPj4gIAo+PiArc3RhdGljIGludCBjcHVfbm90aWZpZXJfY2FsbF9jaGFpbih1bnNp
Z25lZCBpbnQgY3B1LCB1bnNpZ25lZCBsb25nIGFjdGlvbiwKPj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgc3RydWN0IG5vdGlmaWVyX2Jsb2NrICoqbmIpCj4+ICt7Cj4+ICsg
ICAgdm9pZCAqaGNwdSA9ICh2b2lkICopKGxvbmcpY3B1Owo+PiArICAgIGludCBub3RpZmllcl9y
YyA9IG5vdGlmaWVyX2NhbGxfY2hhaW4oJmNwdV9jaGFpbiwgYWN0aW9uLCBoY3B1LCBuYik7Cj4+
ICsKPj4gKyAgICByZXR1cm4gKG5vdGlmaWVyX3JjID09IE5PVElGWV9ET05FKSA/IDAgOiBub3Rp
Zmllcl90b19lcnJubyhub3RpZmllcl9yYyk7Cj4+ICt9Cj4+ICsKPj4gIHN0YXRpYyB2b2lkIF90
YWtlX2NwdV9kb3duKHZvaWQgKnVudXNlZCkKPj4gIHsKPj4gLSAgICB2b2lkICpoY3B1ID0gKHZv
aWQgKikobG9uZylzbXBfcHJvY2Vzc29yX2lkKCk7Cj4+IC0gICAgaW50IG5vdGlmaWVyX3JjID0g
bm90aWZpZXJfY2FsbF9jaGFpbigmY3B1X2NoYWluLCBDUFVfRFlJTkcsIGhjcHUsIE5VTEwpOwo+
PiAtICAgIEJVR19PTihub3RpZmllcl9yYyAhPSBOT1RJRllfRE9ORSk7Cj4+ICsgICAgQlVHX09O
KGNwdV9ub3RpZmllcl9jYWxsX2NoYWluKHNtcF9wcm9jZXNzb3JfaWQoKSwgQ1BVX0RZSU5HLCBO
VUxMKSk7Cj4gCj4gV2hlcmUgcG9zc2libGUsIHdlJ3JlIHRyeWluZyB0byByZW1vdmUgc2lkZSBl
ZmZlY3RzIGZyb20gbWFjcm9zLgo+IAo+IENvdWxkIEkgcGxlYXNlIHRhbGsgeW91IGludG8gd3Jp
dGluZyB0aGlzIGFzOgo+IAo+IGludCByYyA9IGNwdV9ub3RpZmllcl9jYWxsX2NoYWluKHNtcF9w
cm9jZXNzb3JfaWQoKSwgQ1BVX0RZSU5HLCBOVUxMKTsKPiAKPiBCVUdfT04ocmMpOwoKRmluZSB3
aXRoIG1lLgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
