From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 00/12] xen/arm: Add support to build with
 clang
Date: Tue, 16 Apr 2019 15:43:58 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1904161543460.1370@sstabellini-ThinkPad-X260>
References: <20190327184531.30986-1-julien.grall@arm.com>
 <970b4dcfb4e3c04bc9502c7656caa61d2f8c0677.camel@epam.com>
 <8210e96d-c7cd-384e-3277-21fdbfc32105@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VklA=SS=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hGWo4-0002Lj-Lu
 for xen-devel@lists.xenproject.org; Tue, 16 Apr 2019 22:44:00 +0000
In-Reply-To: <8210e96d-c7cd-384e-3277-21fdbfc32105@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Artem Mygaiev <Artem_Mygaiev@epam.com>, "sstabellini@kernel.org" <sstabellini@kernel.org>, "wei.liu2@citrix.com" <wei.liu2@citrix.com>, "rcojocaru@bitdefender.com" <rcojocaru@bitdefender.com>, "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>, "George.Dunlap@eu.citrix.com" <George.Dunlap@eu.citrix.com>, "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>, "tim@xen.org" <tim@xen.org>, Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>, "tamas@tklengyel.com" <tamas@tklengyel.com>, Andrii Anisov <Andrii_Anisov@epam.com>, "jbeulich@suse.com" <jbeulich@suse.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCAyOSBNYXIgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IE9uIDI4LzAzLzIwMTkg
MTE6MjcsIEFydGVtIE15Z2FpZXYgd3JvdGU6Cj4gPiBIaSBKdWxpZW4sCj4gCj4gSGkgQXJ0ZW0s
Cj4gCj4gPiBPbiBXZWQsIDIwMTktMDMtMjcgYXQgMTg6NDUgKzAwMDAsIEp1bGllbiBHcmFsbCB3
cm90ZToKPiA+ID4gSGkgYWxsLAo+ID4gPiAKPiA+ID4gVGhpcyBzZXJpZXMgYWRkcyBzdXBwb3J0
IHRvIGJ1aWxkIFhlbiBBcm0gd2l0aCBjbGFuZy4gVGhpcyBzZXJpZXMgd2FzCj4gPiA+IHRlc3Rl
ZAo+ID4gPiB3aXRoIGNsYW5nIDguMC4KPiA+ID4gCj4gPiA+IE5vdGUgdGhhdCBJIG9ubHkgZGlk
IGJ1aWxkIGZvciBhcm02NC4gSSBzdGlsbCBuZWVkIHRvIGxvb2sgYXQgdGhlIGFybTMyCj4gPiA+
IGJ1aWxkLgo+ID4gPiAKPiA+IAo+ID4gSSB3b25kZXIgaWYgeW91IGhhdmUgdGltZSB0byB0cnkg
dGhlIHNlcmllcyB3aXRoIEFybSBDb21waWxlciA2PyBJIGFtCj4gPiBhc2tpbmcgYmVjYXVzZSBB
RkFJSyBpdCBpcyBiYXNlZCBvbiBjbGFuZy9sbHZtIFsxXSBhbmQgdGhlcmUncyBhCj4gPiBzYWZl
dHktY29tcGxpYW50IHZlcnNpb24gb2YgaXQgY2VydGlmaWVkIGJ5IFRVViBbMl0uIEkgZG9uJ3Qg
aGF2ZSBhCj4gPiBsaWNlbnNlIHlldCBzbyBjYW5ub3QgdHJ5IGl0IG15c2VsZiBidXQgbWF5YmUg
eW91IGhhdmUgYWNjZXNzLgo+IEkgZ2F2ZSBhIHF1aWNrIHRyeSB0byB0aGUgQXJtIENvbXBpbGVy
LiBJIGhhZCB0byBoYWNrIGEgYml0IGNvbmZpZy9TdGRHTlUubWsKPiB0byBwYXNzIGFybWNsYW5n
IGFuZCB0aGUgYXBwcm9wcmlhdGUgdGFyZ2V0IG9wdGlvbi4KPiAKPiBJIGFsc28gaGFkIGEgbGlu
a2luZyBpc3N1ZSBhdCB0aGUgZW5kIHdoZXJlIF9fMnNucHJpbnRmIHdhcyBub3QgZm91bmQuIEl0
Cj4gc2VlbXMgdGhlIGNvbXBpbGVyIHJlcGxhY2Ugc25wcmludGYgd2l0aCBfXzJzbnByaW50Ziwg
SSBoYXZlbid0IGZpZ3VyZWQgb3V0Cj4gd2h5IHlldC4KCkJ1dCBhZnRlciB0aGVzZSBjaGFuZ2Vz
LCBkb2VzIGl0IHdvcms/CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
