From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH 00/12] xen/arm: Add support to build with
 clang
Date: Fri, 29 Mar 2019 10:13:24 +0000
Message-ID: <8210e96d-c7cd-384e-3277-21fdbfc32105@arm.com>
References: <20190327184531.30986-1-julien.grall@arm.com>
 <970b4dcfb4e3c04bc9502c7656caa61d2f8c0677.camel@epam.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=erL7=SA=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1h9oVt-0000by-D7
 for xen-devel@lists.xenproject.org; Fri, 29 Mar 2019 10:13:29 +0000
In-Reply-To: <970b4dcfb4e3c04bc9502c7656caa61d2f8c0677.camel@epam.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Artem Mygaiev <Artem_Mygaiev@epam.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>, "wei.liu2@citrix.com" <wei.liu2@citrix.com>, "rcojocaru@bitdefender.com" <rcojocaru@bitdefender.com>, "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>, "George.Dunlap@eu.citrix.com" <George.Dunlap@eu.citrix.com>, "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>, "tim@xen.org" <tim@xen.org>, Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>, "tamas@tklengyel.com" <tamas@tklengyel.com>, "jbeulich@suse.com" <jbeulich@suse.com>, Andrii Anisov <Andrii_Anisov@epam.com>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAyOC8wMy8yMDE5IDExOjI3LCBBcnRlbSBNeWdhaWV2IHdyb3RlOgo+IEhpIEp1bGllbiwK
CkhpIEFydGVtLAoKPiBPbiBXZWQsIDIwMTktMDMtMjcgYXQgMTg6NDUgKzAwMDAsIEp1bGllbiBH
cmFsbCB3cm90ZToKPj4gSGkgYWxsLAo+Pgo+PiBUaGlzIHNlcmllcyBhZGRzIHN1cHBvcnQgdG8g
YnVpbGQgWGVuIEFybSB3aXRoIGNsYW5nLiBUaGlzIHNlcmllcyB3YXMgdGVzdGVkCj4+IHdpdGgg
Y2xhbmcgOC4wLgo+Pgo+PiBOb3RlIHRoYXQgSSBvbmx5IGRpZCBidWlsZCBmb3IgYXJtNjQuIEkg
c3RpbGwgbmVlZCB0byBsb29rIGF0IHRoZSBhcm0zMgo+PiBidWlsZC4KPj4KPiAKPiBJIHdvbmRl
ciBpZiB5b3UgaGF2ZSB0aW1lIHRvIHRyeSB0aGUgc2VyaWVzIHdpdGggQXJtIENvbXBpbGVyIDY/
IEkgYW0KPiBhc2tpbmcgYmVjYXVzZSBBRkFJSyBpdCBpcyBiYXNlZCBvbiBjbGFuZy9sbHZtIFsx
XSBhbmQgdGhlcmUncyBhCj4gc2FmZXR5LWNvbXBsaWFudCB2ZXJzaW9uIG9mIGl0IGNlcnRpZmll
ZCBieSBUVVYgWzJdLiBJIGRvbid0IGhhdmUgYQo+IGxpY2Vuc2UgeWV0IHNvIGNhbm5vdCB0cnkg
aXQgbXlzZWxmIGJ1dCBtYXliZSB5b3UgaGF2ZSBhY2Nlc3MuCkkgZ2F2ZSBhIHF1aWNrIHRyeSB0
byB0aGUgQXJtIENvbXBpbGVyLiBJIGhhZCB0byBoYWNrIGEgYml0IGNvbmZpZy9TdGRHTlUubWsg
dG8gCnBhc3MgYXJtY2xhbmcgYW5kIHRoZSBhcHByb3ByaWF0ZSB0YXJnZXQgb3B0aW9uLgoKSSBh
bHNvIGhhZCBhIGxpbmtpbmcgaXNzdWUgYXQgdGhlIGVuZCB3aGVyZSBfXzJzbnByaW50ZiB3YXMg
bm90IGZvdW5kLiBJdCBzZWVtcyAKdGhlIGNvbXBpbGVyIHJlcGxhY2Ugc25wcmludGYgd2l0aCBf
XzJzbnByaW50ZiwgSSBoYXZlbid0IGZpZ3VyZWQgb3V0IHdoeSB5ZXQuCgpDaGVlcnMsCgotLSAK
SnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
