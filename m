From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v3 5/7] vpci: fix execution of long running
 operations
Date: Wed, 7 Nov 2018 12:11:46 +0100
Message-ID: <20181107111146.ksaemioxod3uk5p4@mac.citrite.net>
References: <20181030154123.4218-1-roger.pau@citrix.com>
 <20181030154123.4218-6-roger.pau@citrix.com>
 <5BE0762D02000078001F8356@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=kqzb=ns=citrix.com=prvs=842e1f2a3=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gKLka-0004i4-O3
 for xen-devel@lists.xenproject.org; Wed, 07 Nov 2018 11:11:56 +0000
Content-Disposition: inline
In-Reply-To: <5BE0762D02000078001F8356@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBOb3YgMDUsIDIwMTggYXQgMDk6NTY6MTNBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDMwLjEwLjE4IGF0IDE2OjQxLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gQkFSIG1hcC91bm1hcCBpcyBhIGxvbmcgcnVubmluZyBvcGVyYXRpb24gdGhhdCBu
ZWVkcyB0byBiZSBwcmVlbXB0ZWQKPiA+IGluIG9yZGVyIHRvIGF2b2lkIG92ZXJydW5uaW5nIHRo
ZSBhc3NpZ25lZCB2Q1BVIHRpbWUgKG9yIGV2ZW4KPiA+IHRyaWdnZXJpbmcgdGhlIHdhdGNoZG9n
KS4KPiA+IAo+ID4gQ3VycmVudCBsb2dpYyBmb3IgdGhpcyBwcmVlbXB0aW9uIGlzIHdyb25nLCBh
bmQgd29uJ3Qgd29yayBhdCBhbGwgZm9yCj4gPiBBTUQgc2luY2Ugb25seSBJbnRlbCBtYWtlcyB1
c2Ugb2YgaHZtX2lvX3BlbmRpbmcgKGFuZCBldmVuIGluIHRoYXQKPiA+IGNhc2UgdGhlIGN1cnJl
bnQgY29kZSBpcyB3cm9uZykuCj4gCj4gSSdtIGhhdmluZyB0cm91YmxlIHVuZGVyc3RhbmRpbmcg
dGhpcywgYm90aCBmb3IgdGhlIEFNRCBhc3BlY3QKPiAoaXQgaXMgb25seSB2dm14LmMgd2hpY2gg
aGFzIGEgZnVuY3Rpb24gY2FsbCBub3QgbWlycm9yZWQgb24gdGhlCj4gQU1EIHNpZGUpIGFuZCBm
b3IgdGhlIHN1cHBvc2VkIGdlbmVyYWwgYnJva2VubmVzcy4gV2l0aG91dAo+IHNvbWUgY2xhcmlm
aWNhdGlvbiBJIGNhbid0IGp1ZGdlIHdoZXRoZXIgcmUtaW1wbGVtZW50aW5nIHZpYQo+IHRhc2ts
ZXQgaXMgYWN0dWFsbHkgdGhlIGJlc3QgYXBwcm9hY2guCgpodm1faW9fcGVuZGluZyBpdHNlbGYg
Y2Fubm90IGJsb2NrIHRoZSB2Q1BVIGZyb20gZXhlY3V0aW5nLCBpdCdzIHVzZWQKYnkgbnZteF9z
d2l0Y2hfZ3Vlc3QgaW4gb3JkZXIgdG8gcHJldmVudCBjaGFuZ2luZyB0aGUgbmVzdGVkIFZNQ1Mg
aWYKdGhlcmUncyBwZW5kaW5nIElPIGVtdWxhdGlvbiB3b3JrIEFGQUlDVC4KClRoZSBvbmx5IHdh
eSBJIGNvdWxkIGZpbmQgdG8gYWN0dWFsbHkgcHJldmVudCBhIHZDUFUgZnJvbSBydW5uaW5nCndo
aWxlIGRvaW5nIHNvbWUgd29yayBvbiBpdCdzIGJlaGFsZiBpbiBhIHByZWVtcHRpdmUgd2F5IGlz
IGJ5CmJsb2NraW5nIGl0IGFuZCB1c2luZyBhIHRhc2tsZXQuIFdoYXQncyBkb25lIHdpdGggSU9S
RVFzIGlzIG5vdApzdWl0YWJsZSBoZXJlIHNpbmNlIFhlbiBuZWVkcyB0byBkbyBzb21lIHdvcmsg
aW5zdGVhZCBvZiBqdXN0IHdhaXQgb24KYW4gZXh0ZXJuYWwgZXZlbnQgKGFuIGV2ZW50IGNoYW5u
ZWwgZnJvbSB0aGUgSU9SRVEpLgoKPiA+ICt2b2lkIHZwY2lfaW5pdF92Y3B1KHN0cnVjdCB2Y3B1
ICp2KQo+ID4gK3sKPiA+ICsgICAgdGFza2xldF9pbml0KCZ2LT52cGNpLnRhc2ssIHZwY2lfcHJv
Y2Vzc19wZW5kaW5nLCAodW5zaWduZWQgbG9uZyl2KTsKPiA+ICB9Cj4gCj4gU2luY2UgdGhlcmUn
cyBubyByZXNwZWN0aXZlIGNsZWFudXAgY29kZSBhZGRlZCBhZmFpY3MgLSB3aGF0Cj4gaWYgdGhl
IGRvbWFpbiBnZXRzIGNsZWFuZWQgdXAgYmVoaW5kIHRoZSBiYWNrIG9mIHRoZSAobG9uZwo+IHJ1
bm5pbmcpIHRhc2tsZXQ/IERvbid0IHlvdSB3YW50IHRvIGFjcXVpcmUgKGFuZCB0aGVuIHJlbGVh
c2UpCj4gYW4gZXh0cmEgZG9tYWluIHJlZmVyZW5jZSBzb21ld2hlcmU/CgpZZXMsIHRoYXQncyBj
b3JyZWN0LiBJc24ndCBqdXN0IGRvaW5nIGEgdGFza2xldF9raWxsIGF0IGRvbWFpbgpkZXN0cnVj
dGlvbiBlbm91Z2g/CgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
