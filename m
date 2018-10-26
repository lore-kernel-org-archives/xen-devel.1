From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: Ongoing/future speculative mitigation work
Date: Fri, 26 Oct 2018 10:28:20 +0100
Message-ID: <20181026092820.bernuj2cskqtwqqv@zion.uk.xensource.com>
References: <e3219697-0759-39fc-2486-715cdec1ca9e@citrix.com>
 <20181022145534.afuxnfzyovdi3hya@zion.uk.xensource.com>
 <5BD1D82402000078001F4B60@prv1-mh.provo.novell.com>
 <187f3a6a-e83e-3dc2-0cb7-69fecdacacf1@citrix.com>
 <5BD1DAEC02000078001F4BAE@prv1-mh.provo.novell.com>
 <e1388467-9dc8-9012-f9b8-587617a97a73@citrix.com>
 <5BD2DB5F02000078001F4F31@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <5BD2DB5F02000078001F4F31@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Martin Pohlack <mpohlack@amazon.de>, Julien Grall <julien.grall@arm.com>, Joao Martins <joao.m.martins@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>, Mihai Dontu <mdontu@bitdefender.com>, Marek Marczykowski <marmarek@invisiblethingslab.com>, Anthony Liguori <aliguori@amazon.com>, uwed@amazon.de, Lars Kurth <lars.kurth@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ross Philipson <ross.philipson@oracle.com>, george.dunlap@citrix.com, Dario Faggioli <dfaggioli@suse.com>, Matt Wilson <msw@amazon.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>, Sergey Dyasli <sergey.dyasli@citrix.com>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel List <xen-devel@lists.xen.org>, Daniel Kiper <daniel.kiper@oracle.com>, David Woodhouse <dwmw@amazon.c>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBPY3QgMjYsIDIwMTggYXQgMDM6MTY6MTVBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDI1LjEwLjE4IGF0IDE4OjI5LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNv
bT4gd3JvdGU6Cj4gPiBBIHNwbGl0IHhlbmhlYXAgbW9kZWwgbWVhbnMgdGhhdCBkYXRhIHBlcnRh
aW5pbmcgdG8gb3RoZXIgZ3Vlc3RzIGlzbid0Cj4gPiBtYXBwZWQgaW4gdGhlIGNvbnRleHQgb2Yg
dGhpcyB2Y3B1LCBzbyBjYW5ub3QgYmUgYnJvdWdodCBpbnRvIHRoZSBjYWNoZS4KPiAKPiBJdCB3
YXMgbm90IGNsZWFyIHRvIG1lIGZyb20gV2VpJ3Mgb3JpZ2luYWwgbWFpbCB0aGF0IHRhbGsgaGVy
ZSBpcwo+IGFib3V0ICJzcGxpdCIgaW4gYSBzZW5zZSBvZiAicGVyLWRvbWFpbiI7IEkgd2FzIGFz
c3VtaW5nIHRoZQo+IENPTkZJR19TRVBBUkFURV9YRU5IRUFQIG1vZGUgaW5zdGVhZC4KClRoZSBz
cGxpdCBoZWFwIHdhcyBpbmRlZWQgcmVmZXJyaW5nIHRvIENPTkZJR19TRVBBUkFURV9YRU5IRUFQ
IG1vZGUsIHlldApJIHdoYXQgSSB3YW50ZWQgbW9zdCBpcyB0aGUgcGFydGlhbCBkaXJlY3QgbWFw
IHdoaWNoIHJlZHVjZXMgdGhlIGFtb3VudApvZiBkYXRhIG1hcHBlZCBpbnNpZGUgWGVuIGNvbnRl
eHQgLS0gdGhlIG9yaWdpbmFsIGlkZWEgd2FzIHJlbW92aW5nCmRpcmVjdCBtYXAgZGlzY3Vzc2Vk
IGR1cmluZyBvbmUgb2YgdGhlIGNhbGxzIElJUkMuIEkgdGhvdWdodCBtYWtpbmcgdGhlCnBhcnRp
YWwgZGlyZWN0IG1hcCBtb2RlIHdvcmsgYW5kIG1ha2UgaXQgYXMgc21hbGwgYXMgcG9zc2libGUg
d2lsbCBnZXQKdXMgOTAlIHRoZXJlLgoKVGhlICJwZXItZG9tYWluIiBoZWFwIGlzIGEgZGlmZmVy
ZW50IHdvcmsgaXRlbS4KCldlaS4KCj4gCj4gSmFuCj4gCj4gCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
