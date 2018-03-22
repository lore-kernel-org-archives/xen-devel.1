From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v11 04/12] pci: split code to size BARs from
 pci_add_device
Date: Thu, 22 Mar 2018 04:33:10 -0600
Message-ID: <5AB3947602000078001B4EED@prv-mh.provo.novell.com>
References: <20180320151543.84348-1-roger.pau@citrix.com>
 <20180320151543.84348-5-roger.pau@citrix.com>
 <5AB3903A02000078001B4EA0@prv-mh.provo.novell.com>
 <20180322103112.d4z3th6ku3sinyw5@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=hhfi=gm=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1eyxX1-0006az-QC
 for xen-devel@lists.xenproject.org; Thu, 22 Mar 2018 10:33:15 +0000
In-Reply-To: <20180322103112.d4z3th6ku3sinyw5@MacBook-Pro-de-Roger.local>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIyLjAzLjE4IGF0IDExOjMxLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIFRodSwgTWFyIDIyLCAyMDE4IGF0IDA0OjE1OjA2QU0gLTA2MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiA+Pj4gT24gMjAuMDMuMTggYXQgMTY6MTUsIDxyb2dlci5wYXVAY2l0cml4LmNvbT4g
d3JvdGU6Cj4+ID4gQEAgLTY3MiwxMSArNzIyLDE2IEBAIGludCBwY2lfYWRkX2RldmljZSh1MTYg
c2VnLCB1OCBidXMsIHU4IGRldmZuLAo+PiA+ICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgaTsK
Pj4gPiAgCj4+ID4gICAgICAgICAgICAgIEJVSUxEX0JVR19PTihBUlJBWV9TSVpFKHBkZXYtPnZm
X3JsZW4pICE9IFBDSV9TUklPVl9OVU1fQkFSUyk7Cj4+ID4gLSAgICAgICAgICAgIGZvciAoIGkg
PSAwOyBpIDwgUENJX1NSSU9WX05VTV9CQVJTOyArK2kgKQo+PiA+ICsgICAgICAgICAgICBmb3Ig
KCBpID0gMDsgaSA8IFBDSV9TUklPVl9OVU1fQkFSUzsgKQo+PiA+ICAgICAgICAgICAgICB7Cj4+
ID4gICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgaWR4ID0gcG9zICsgUENJX1NSSU9WX0JB
UiArIGkgKiA0Owo+PiA+ICAgICAgICAgICAgICAgICAgdTMyIGJhciA9IHBjaV9jb25mX3JlYWQz
MihzZWcsIGJ1cywgc2xvdCwgZnVuYywgaWR4KTsKPj4gPiAtICAgICAgICAgICAgICAgIHUzMiBo
aSA9IDA7Cj4+ID4gKyAgICAgICAgICAgICAgICBwY2lfc2JkZl90IHNiZGYgPSB7Cj4+ID4gKyAg
ICAgICAgICAgICAgICAgICAgLnNlZyA9IHNlZywKPj4gPiArICAgICAgICAgICAgICAgICAgICAu
YnVzID0gYnVzLAo+PiA+ICsgICAgICAgICAgICAgICAgICAgIC5kZXYgPSBzbG90LAo+PiA+ICsg
ICAgICAgICAgICAgICAgICAgIC5mdW5jID0gZnVuYywKPj4gPiArICAgICAgICAgICAgICAgIH07
Cj4+IAo+PiBTbyBJJ3ZlIGhhZCBldmVyeXRoaW5nIHVwIHRvIHBhdGNoIDkgYXBwbGllZCBhbmQg
cmVhZHkgZm9yIHB1c2hpbmcsCj4+IHdoZW4gSSBkaWQgbXkgdXN1YWwgc2Vjb25kYXJ5IGNvbXBp
bGUgdGVzdCBvbiBhbiBvbGQgc3lzdGVtOiBUaGlzCj4+IGZhaWxzIHRvIGNvbXBpbGUgd2l0aCBn
Y2MgNC4zIChkdWUgdG8gdGhlcmUgYmVpbmcgYSB1bm5hbWVkIHN1Yi0KPj4gc3RydWN0dXJlKS4g
QSBzaW1pbGFyIGlzc3VlIGV4aXN0cyBhdCBsZWFzdCBpbiBwYXRjaCA3LiBTaW5jZSB0aGUKPj4g
c3RydWN0dXJlIGdldHMgaW50cm9kdWNlZCBpbiBwYXRjaCAxIChhbmQgaGVuY2UgbWF5IG5lZWQg
Y2hhbmdpbmcKPiAKPiBwY2lfc2JkZl90IGlzIGFscmVhZHkgaW4gdGhlIHNvdXJjZSB0cmVlLCBp
dCB3YXMgaW50cm9kdWNlZCBieQo+IDUxNGY1OGQ0NDY4YTQwYjVkZDQxOGE1ZWExNzQyNjgxOTMw
YzNmMmQgYmFjayBpbiBEZWNlbWJlci4KCk9oLCBJIGd1ZXNzIGl0J3MgdGhlIHRlc3QgaGFybmVz
cyBpbnN0YW5jZSB0aGF0IEkndmUgbWlzdGFrZW5seSBzZWVuCmluIHRoZSBncmVwIG91dHB1dCBo
ZXJlLgoKSmFuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
