From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH RFC 31/49] xen/sched: use sched_resource cpu
 instead smp_processor_id in schedulers
Date: Sat, 30 Mar 2019 11:22:25 +0100
Message-ID: <7637592e-c241-dd48-ea6c-ea0e3c5738e4@suse.com>
References: <20190329150934.17694-1-jgross@suse.com>
 <20190329150934.17694-32-jgross@suse.com>
 <6ae60c7f-e295-d758-cf60-9f24113236e1@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=EaPS=SB=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hAB89-0001je-K1
 for xen-devel@lists.xenproject.org; Sat, 30 Mar 2019 10:22:29 +0000
In-Reply-To: <6ae60c7f-e295-d758-cf60-9f24113236e1@citrix.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <george.dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>, Robert VanVossen <robert.vanvossen@dornerworks.com>, Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>, Josh Whitehead <josh.whitehead@dornerworks.com>, Meng Xu <mengxu@cis.upenn.edu>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjkvMDMvMjAxOSAyMDozNiwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAyOS8wMy8yMDE5
IDE1OjA5LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+PiBkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9z
Y2hlZHVsZS5jIGIveGVuL2NvbW1vbi9zY2hlZHVsZS5jCj4+IGluZGV4IDliNTUyN2MxZWIuLjBi
NWU1ZTU2NmIgMTAwNjQ0Cj4+IC0tLSBhL3hlbi9jb21tb24vc2NoZWR1bGUuYwo+PiArKysgYi94
ZW4vY29tbW9uL3NjaGVkdWxlLmMKPj4gQEAgLTM0Nyw3ICszNDcsNyBAQCBpbnQgc2NoZWRfaW5p
dF92Y3B1KHN0cnVjdCB2Y3B1ICp2KQo+PiAgICAgIGlmICggKGl0ZW0gPSBzY2hlZF9hbGxvY19p
dGVtKHYpKSA9PSBOVUxMICkKPj4gICAgICAgICAgcmV0dXJuIDE7Cj4+ICAKPj4gLSAgICBpZiAo
IGlzX2lkbGVfZG9tYWluKGQpIHx8IGQtPmlzX3Bpbm5lZCApCj4+ICsgICAgaWYgKCBpc19pZGxl
X2RvbWFpbihkKSApCj4+ICAgICAgICAgIHByb2Nlc3NvciA9IHYtPnZjcHVfaWQ7Cj4+ICAgICAg
ZWxzZQo+PiAgICAgICAgICBwcm9jZXNzb3IgPSBzY2hlZF9zZWxlY3RfaW5pdGlhbF9jcHUodik7
Cj4gCj4gVGhpcyBsb29rcyBsaWtlIGEgc3B1cmlvdXMgY2hhbmdlLsKgIEkgYWxzbyBkb24ndCBh
biBvYnZpb3VzIG90aGVyIHBhdGNoCj4gdGhhdCBpdCBtaWdodCBmaXQgaW50by4KClRoYXQgc2hv
dWxkIGJlIGluIHBhdGNoIDMwLgoKPiBBcyBmb3IgdGhlIGZpZWxkIGl0c2VsZiwgaXQgaXMgYWxz
byBmYWlybHkgb2JqZWN0aW9uYWJsZS7CoCBJdCBpcyBvbmx5Cj4gZXZlciBzZXQgZm9yIHRoZSBo
YXJkd2FyZSBkb21haW4sIGFuZCBvbmx5IGlmIGRvbTBfdmNwdXNfcGluIGlzIHVzZWQsCj4gYnV0
IHRoZSBhY3R1YWwgcGlubmluZyBpbmZvcm1hdGlvbiBpcyBhbHNvIHJlZmxlY3RlZCBpbiBkb20w
J3MgaGFyZAo+IGFmZmluaXR5IG1hc2suCgpSaWdodC4KCj4gSW4gcHJhY3RpY2UsIGFsbCB0aGlz
IGZsYWcgZG9lcyBpcyBwZXJtaXQgdGhlIHVzZSBvZiBWQ1BVT1BfZ2V0X3BoeXNpZCwKPiBkaXNh
bGxvdyB0aGUgdXNlIG9mIHZjcHVfc2V0X2hhcmRfYWZmaW5pdHkoKSwgYW5kIGFsbG93IGRvbTAg
dG8gYXR0ZW1wdAo+IHRvIGFjdHVhbGx5IHdyaXRlIHRvIE1TUl9BTUQ2NF9OQl9DRkcsIE1TUl9G
QU0xMEhfTU1JT19DT05GX0JBU0UsCj4gTVNSX0lBMzJfVUNPREVfUkVWLCBNU1JfSUEzMl9USEVS
TV9DT05UUk9MIGFuZAo+IE1TUl9JQTMyX0VORVJHWV9QRVJGX0JJQVMsIHJhdGhlciB0aGFuIGhh
dmluZyB0aGUgd3JpdGUgc2lsZW50bHkgZGlzY2FyZGVkLgo+IAo+IERvbTAncyB1c2Ugb2YgdGhv
c2UgTVNScyBpcyBkdWJpb3VzIGF0IGJlc3QsIGFuZCBkaXNhYmxlZCBieSBkZWZhdWx0LAo+ICph
bmQqIHdoZW4gYWN0aXZlLCBhbHNvIGNyb3NzLWNoZWNrcyB3aXRoIHRoZSBoYXJkIGFmZmluaXR5
IG1hc2suwqAgRG9lcwo+IGFueW9uZSB1c2UgZG9tMF92Y3B1c19waW4gaW4gcHJvZHVjdGlvbj8K
CkkgaGF2ZSBzZWVuIGl0IG9uIGN1c3RvbWVyIHN5c3RlbXMuCgo+IEkgdGhpbmsgdGhlcmUgaXMg
cXVpdGUgYSBsb3Qgb2YgdmFsdWUgaW4gZ2V0dGluZyByaWQgb2YgZC0+aXNfcGlubmVkIGFuZAo+
IGlzX3Bpbm5lZF92Y3B1KCkgZW50aXJlbHksIHdpdGggd2lsbCByZW1vdmUgYW4gZXh0cmVtZQo+
IGNvcm5lci1jYXNlLXg4Ni1pc20gb3V0IG9mIHRoZSBjb21tb24gY29kZS4KClJpZ2h0LiBJIGRv
bid0IHNlZSBhIHJlYXNvbiB3aHkgd2UgbmVlZCBhbnl0aGluZyBlbHNlIGJ1dCB0aGUgaGFyZAph
ZmZpbml0eSBmb3IgdGhpcyBvcHRpb24uCgpBbGxvd2luZyB0byByZS1waW4gKG9yIHVucGluKSB2
Y3B1cyBzaG91bGQgYmUgZmluZS4gQW5kIHVzZSBvZiB0aGUKc2FpZCBNU1JzIGNvdWxkIGJlIHJl
c3RyaWN0ZWQgdG8gdGhlIGNvcnJlY3QgaGFyZCBhZmZpbml0eSBiZWluZwphY3RpdmUuCgoKSnVl
cmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
