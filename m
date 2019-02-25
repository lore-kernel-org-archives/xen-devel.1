From: Norbert Manthey <nmanthey@amazon.de>
Subject: Re: [PATCH SpectreV1+L1TF v7 4/9] nospec: introduce
 evaluate_nospec
Date: Mon, 25 Feb 2019 09:18:59 +0100
Message-ID: <1c26cddc-c23a-8811-1ec0-5f29e462dcc4@amazon.de>
References: <1550737003-25779-1-git-send-email-nmanthey@amazon.de>
 <1550737003-25779-5-git-send-email-nmanthey@amazon.de>
 <5C6FF68302000078002192E8@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9cCv=RA=amazon.de=prvs=952b5b9ed=nmanthey@srs-us1.protection.inumbo.net>)
 id 1gyBUo-0004Vy-G4
 for xen-devel@lists.xenproject.org; Mon, 25 Feb 2019 08:20:18 +0000
In-Reply-To: <5C6FF68302000078002192E8@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Martin Pohlack <mpohlack@amazon.de>, wipawel@amazon.de, Julien Grall <julien.grall@arm.com>, David Woodhouse <dwmw@amazon.co.uk>, "Martin Mazein(amazein)" <amazein@amazon.de>, xen-devel <xen-devel@lists.xenproject.org>, Julian Stecklina <jsteckli@amazon.de>, Bjoern Doebel <doebel@amazon.de>
List-Id: xen-devel@lists.xenproject.org

T24gMi8yMi8xOSAxNDoxNywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjEuMDIuMTkgYXQg
MDk6MTYsIDxubWFudGhleUBhbWF6b24uZGU+IHdyb3RlOgo+PiAtLS0gL2Rldi9udWxsCj4+ICsr
KyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvbm9zcGVjLmgKPj4gQEAgLTAsMCArMSwzOCBAQAo+PiAr
LyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAgKi8KPj4gKy8qIENvcHlyaWdodCAy
MDE4IEFtYXpvbi5jb20sIEluYy4gb3IgaXRzIGFmZmlsaWF0ZXMuIEFsbCBSaWdodHMgUmVzZXJ2
ZWQuICovCj4+ICsKPj4gKyNpZm5kZWYgX0FTTV9YODZfTk9TUEVDX0gKPj4gKyNkZWZpbmUgX0FT
TV9YODZfTk9TUEVDX0gKPj4gKwo+PiArI2luY2x1ZGUgPGFzbS9hbHRlcm5hdGl2ZS5oPgo+PiAr
Cj4+ICsvKiBBbGxvdyB0byBpbnNlcnQgYSByZWFkIG1lbW9yeSBiYXJyaWVyIGludG8gY29uZGl0
aW9uYWxzICovCj4+ICtzdGF0aWMgYWx3YXlzX2lubGluZSBib29sIGJhcnJpZXJfbm9zcGVjX3Ry
dWUodm9pZCkKPj4gK3sKPj4gKyNpZmRlZiBDT05GSUdfSFZNCj4+ICsgICAgYWx0ZXJuYXRpdmUo
IiIsICJsZmVuY2UiLCBYODZfRkVBVFVSRV9TQ19MMVRGX1ZVTE4pOwo+PiArI2VuZGlmCj4+ICsg
ICAgcmV0dXJuIHRydWU7Cj4+ICt9Cj4+ICsKPj4gKy8qIEFsbG93IHRvIHByb3RlY3QgZXZhbHVh
dGlvbiBvZiBjb25kaXRpb25hc2wgd2l0aCByZXNwZWN0IHRvIHNwZWN1bGF0aW9uICovCj4+ICsj
aWZkZWYgQ09ORklHX0hWTQo+PiArI2RlZmluZSBldmFsdWF0ZV9ub3NwZWMoY29uZGl0aW9uKSAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+PiArICAgICgoY29uZGl0
aW9uKSA/IGJhcnJpZXJfbm9zcGVjX3RydWUoKSA6ICFiYXJyaWVyX25vc3BlY190cnVlKCkpCj4+
ICsjZWxzZQo+PiArI2RlZmluZSBldmFsdWF0ZV9ub3NwZWMoY29uZGl0aW9uKSAoY29uZGl0aW9u
KQo+PiArI2VuZGlmCj4+ICsKPj4gKy8qIEFsbG93IHRvIGJsb2NrIHNwZWN1bGF0aXZlIGV4ZWN1
dGlvbiBpbiBnZW5lcmljIGNvZGUgKi8KPj4gKyNkZWZpbmUgYmxvY2tfc3BlY3VsYXRpb24oKSAo
KHZvaWQpYmFycmllcl9ub3NwZWNfdHJ1ZSgpKQo+IFNlZWluZyBKdWxpZW4ncyByZXF1ZXN0IGZv
ciBzd2l0Y2hpbmcgdG8gaW5saW5lIGZ1bmN0aW9ucyBvbiB0aGUgQXJtIHNpZGUsCj4gaXMgdGhl
cmUgYW55dGhpbmcgcHJldmVudGluZyB0aGVzZSB0d28gdG8gYmVjb21lIGlubGluZSBmdW5jdGlv
bnMgdG9vPwoKTm8sIHRoZXJlIGlzIG5vdGhpbmcgcHJldmVudGluZyB1c2luZyBmdW5jdGlvbnMg
aGVyZS4gSSBtb3N0bHkgY29waWVkCnRoZSBtYWNybyBzdHlsZSBmcm9tIG90aGVyIG5vc3BlYyBj
b25zdHJ1Y3RzLiBJIHRlc3RlZCB0aGUgZ2VuZXJhdGVkCmJpbmFyeSBmb3IgdGhlIGZ1bmN0aW9u
cyBiZWluZyBhbHdheXNfaW5saW5lLCBhbmQgdGhlIHJlc3VsdCBpcyB0aGUgc2FtZQphcyB3aGVu
IHVzaW5nIG1hY3Jvcy4gSSB3aWxsIHR1cm4gdGhlIG1hY3JvcyBpbnRvIGZ1bmN0aW9ucyB0aGF0
IHVzZSB0aGUKYWx3YXlzX2lubGluZSBrZXl3b3JkLCBhcyB0aGVyZSBoYXZlIGJlZW4gcHJvYmxl
bXMgd2l0aCB0aGUKYmFycmllcl9ub3NwZWNfdHJ1ZSBmdW5jdGlvbiB3aGVuIG5vdCB1c2luZyBh
bHdheXNfaW5saW5lLgoKQmVzdCwKTm9yYmVydAoKCgoKQW1hem9uIERldmVsb3BtZW50IENlbnRl
ciBHZXJtYW55IEdtYkgKS3JhdXNlbnN0ci4gMzgKMTAxMTcgQmVybGluCkdlc2NoYWVmdHNmdWVo
cmVyOiBDaHJpc3RpYW4gU2NobGFlZ2VyLCBSYWxmIEhlcmJyaWNoClVzdC1JRDogREUgMjg5IDIz
NyA4NzkKRWluZ2V0cmFnZW4gYW0gQW10c2dlcmljaHQgQ2hhcmxvdHRlbmJ1cmcgSFJCIDE0OTE3
MyBCCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
