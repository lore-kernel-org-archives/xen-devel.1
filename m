From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH V5 2/3] x86/mm: allocate logdirty_ranges for
 altp2ms
Date: Wed, 14 Nov 2018 08:05:32 -0700
Message-ID: <5BEC39BC02000078001FC0F0@prv1-mh.provo.novell.com>
References: <1541945224-23075-1-git-send-email-rcojocaru@bitdefender.com>
 <1541945224-23075-3-git-send-email-rcojocaru@bitdefender.com>
 <2c1b78c1-e526-4481-f36d-791e11bdd06e@citrix.com>
 <7b71af9a-29ca-6f7e-13a3-27d02e0392f6@bitdefender.com>
 <227360f1-e375-e990-55f3-abbf85a312fc@citrix.com>
 <5515809b-33dd-3afb-8cce-7261e45dc501@bitdefender.com>
 <5BEC2A8702000078001FC04A@prv1-mh.provo.novell.com>
 <e1c265ea-48c7-e6a0-74ca-d8ab16fff348@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=etbn=nz=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gMwjZ-0001JA-Cg
 for xen-devel@lists.xenproject.org; Wed, 14 Nov 2018 15:05:37 +0000
In-Reply-To: <e1c265ea-48c7-e6a0-74ca-d8ab16fff348@bitdefender.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, george.dunlap@citrix.com, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE0LjExLjE4IGF0IDE1OjA1LCA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4gd3Jv
dGU6Cj4gT24gMTEvMTQvMTggNDowMCBQTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDE0
LjExLjE4IGF0IDEzOjUwLCA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4gd3JvdGU6Cj4+PiBP
biAxMS8xNC8xOCAxOjU4IFBNLCBHZW9yZ2UgRHVubGFwIHdyb3RlOgo+Pj4+IE9uIDExLzEzLzE4
IDY6NDMgUE0sIFJhenZhbiBDb2pvY2FydSB3cm90ZToKPj4+Pj4gT24gMTEvMTMvMTggNzo1NyBQ
TSwgR2VvcmdlIER1bmxhcCB3cm90ZToKPj4+Pj4+IE9uIDExLzExLzE4IDI6MDcgUE0sIFJhenZh
biBDb2pvY2FydSB3cm90ZToKPj4+Pj4+PiBAQCAtMjM0MSw2ICsyMzgwLDcgQEAgaW50IHAybV9k
ZXN0cm95X2FsdHAybV9ieV9pZChzdHJ1Y3QgZG9tYWluICpkLCB1bnNpZ25lZCBpbnQgaWR4KQo+
Pj4+Pj4+ICAgICAgICAgIHsKPj4+Pj4+PiAgICAgICAgICAgICAgcDJtX2ZsdXNoX3RhYmxlKGQt
PmFyY2guYWx0cDJtX3AybVtpZHhdKTsKPj4+Pj4+PiAgICAgICAgICAgICAgLyogVW5pbml0IGFu
ZCByZWluaXQgZXB0IHRvIGZvcmNlIFRMQiBzaG9vdGRvd24gKi8KPj4+Pj4+PiArICAgICAgICAg
ICAgcDJtX2ZyZWVfbG9nZGlydHkoZC0+YXJjaC5hbHRwMm1fcDJtW2lkeF0pOwo+Pj4+Pj4+ICAg
ICAgICAgICAgICBlcHRfcDJtX3VuaW5pdChkLT5hcmNoLmFsdHAybV9wMm1baWR4XSk7Cj4+Pj4+
Pj4gICAgICAgICAgICAgIGVwdF9wMm1faW5pdChkLT5hcmNoLmFsdHAybV9wMm1baWR4XSk7Cj4+
Pj4+Pj4gICAgICAgICAgICAgIGQtPmFyY2guYWx0cDJtX2VwdHBbaWR4XSA9IG1mbl94KElOVkFM
SURfTUZOKTsKPj4+Pj4+Cj4+Pj4+PiAoSW4gY2FzZSBJIGZvcmdldDogQWxzbywgdGhpcyBpcyBj
YWxsZWQgd2l0aG91dCBob2xkaW5nIHRoZSBhcHByb3ByaWF0ZQo+Pj4+Pj4gcDJtIGxvY2suICkK
Pj4+Pj4KPj4+Pj4gQ291bGQgeW91IHBsZWFzZSBwcm92aWRlIG1vcmUgZGV0YWlscz8gSSBoYXZl
IGFzc3VtZWQgdGhhdCBhdCB0aGUgcG9pbnQKPj4+Pj4gb2YgY2FsbGluZyBhIGZ1bmN0aW9uIGNh
bGxlZCBwMm1fZGVzdHJveV9hbHRwMm1fYnlfaWQoKSBpdCBzaG91bGQgYmUKPj4+Pj4gc2FmZSB0
byB0ZWFyIHRoZSBhbHRwMm0gZG93biB3aXRob3V0IGZ1cnRoZXIgcHJlY2F1dGlvbi4KPj4+Pgo+
Pj4+IEFyZSB5b3UgYWJzb2x1dGVseSBwb3NpdGl2ZSB0aGF0IGF0IHRoaXMgcG9pbnQgdGhlcmUn
cyBubyB3YXkgYW55d2hlcmUKPj4+PiBlbHNlIGluIFhlbiBtaWdodCBiZSBkb2luZyBzb21ldGhp
bmcgd2l0aCB0aGlzIHAybSBzdHJ1Y3Q/Cj4+Pj4KPj4+PiBJZiBzbywgdGhlbiAxKSB0aGVyZSBz
aG91bGQgYmUgYSBjb21tZW50IHRoZXJlIGV4cGxhaW5pbmcgd2h5IHRoYXQncyB0aGUKPj4+PiBj
YXNlLCBhbmQgMikgaWRlYWxseSB3ZSBzaG91bGQgcmVmYWN0b3IgcDJtX2ZsdXNoX3RhYmxlIHN1
Y2ggdGhhdCB3ZSBjYW4KPj4+PiBjYWxsIHdoYXQncyBub3cgcDJtX2ZsdXNoX3RhYmxlX2xvY2tl
ZCgpIHdpdGhvdXQgdGhlIGxvY2suCj4+Pgo+Pj4gQUZBSUNUIHRoZSBvbmx5IHBsYWNlIHAybV9k
ZXN0cm95X2FsdHAybV9ieV9pZCgpIGlzIGV2ZXIgY2FsbGVkIGlzIGluCj4+PiBhcmNoL3g4Ni9o
dm0vaHZtLmMncyBkb19hbHRwMm1fb3AoKSAob24gSFZNT1BfYWx0cDJtX2Rlc3Ryb3lfcDJtKSwg
d2hpY2gKPj4+IGlzIGRvbmUgdW5kZXIgZG9tYWluIGxvY2suIElzIHRoYXQgaW5zdWZmaWNpZW50
Pwo+PiAKPj4gSG9sZGluZyB0aGUgZG9tYWluIGxvY2sgZG9lcyBub3QgaW1wbHkgbm90aGluZyBj
YW4gaGFwcGVuIHRvIHRoZQo+PiBkb21haW4gZWxzZXdoZXJlLiBPbmx5IGlmIGJvdGggcGFydGll
cyBob2xkIHRoZSBfc2FtZV8gbG9jayB0aGVyZQo+PiBpcyBhIGd1YXJhbnRlZSBvZiBzZXJpYWxp
emF0aW9uIGJldHdlZW4gYm90aC4KPiAKPiBSaWdodCwgSSB3YXMgdW5kZXIgdGhlIGltcHJlc3Np
b24gdGhhdCBmb3IgdGhlIGR1cmF0aW9uIG9mIGEgSFZNT1AgKG9yCj4gRE9NQ1RMKSBub3RoaW5n
IG1vdmVzIGluIHRoZSBkb21haW4uCgpXZWxsLCBpZiB5b3UgbmVlZCBzdWNoIGJlaGF2aW9yLCB5
b3UgbmVlZCB0byBwYXVzZSB0aGUgZG9tYWluIChhcwp2YXJpb3VzIGRvbWN0bC1zIGFjdHVhbGx5
IGRvKS4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
