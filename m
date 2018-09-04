From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 2/2] xen: fill topology info for all
 present cpus
Date: Tue, 04 Sep 2018 02:49:05 -0600
Message-ID: <5B8E470102000078001E4FE8@prv1-mh.provo.novell.com>
References: <20180831152205.21872-1-jgross@suse.com>
 <20180831152205.21872-3-jgross@suse.com>
 <5B8D39F402000078001E4A17@prv1-mh.provo.novell.com>
 <01442930-60b8-4702-1f46-b7e2ab03ebdf@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=qfrq=ls=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fx71M-0007Nr-9z
 for xen-devel@lists.xenproject.org; Tue, 04 Sep 2018 08:49:12 +0000
In-Reply-To: <01442930-60b8-4702-1f46-b7e2ab03ebdf@suse.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA0LjA5LjE4IGF0IDA5OjM4LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBPbiAw
My8wOS8xOCAxNTo0MSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDMxLjA4LjE4IGF0IDE3
OjIyLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPj4+IFRoZSB0b3BvbG9neSBpbmZvcm1hdGlv
biBvYnRhaW5hYmxlIHZpYSBYRU5fU1lTQ1RMX2NwdXRvcG9pbmZvIGlzCj4+PiBmaWxsZWQgcmF0
aGVyIHdlaXJkOiB0aGUgc2l6ZSBvZiB0aGUgYXJyYXkgaXMgZGVyaXZlZCBmcm9tIHRoZSBoaWdo
ZXN0Cj4+PiBvbmxpbmUgY3B1IG51bWJlciwgc28gaW4gY2FzZSB0aGVyZSBhcmUgdHJhaWxpbmcg
b2ZmbGluZSBjcHVzIHRoZXkKPj4+IHdpbGwgbm90IGJlIGluY2x1ZGVkLgo+Pj4KPj4+IE9uIGEg
ZHVhbCBjb3JlIHN5c3RlbSB3aXRoIDQgdGhyZWFkcyBib290ZWQgd2l0aCBzbXQ9MCB3aXRob3V0
IHRoaXMKPj4+IHBhdGNoIHhsIGluZm8gLW4gd2lsbCBwcmludDoKPj4+Cj4+PiBjcHVfdG9wb2xv
Z3kgICAgICAgICAgIDoKPj4+IGNwdTogICAgY29yZSAgICBzb2NrZXQgICAgIG5vZGUKPj4+ICAg
MDogICAgICAgMCAgICAgICAgMCAgICAgICAgMAo+Pj4gICAxOiAgICAgICAwICAgICAgICAwICAg
ICAgICAwCj4+PiAgIDI6ICAgICAgIDEgICAgICAgIDAgICAgICAgIDAKPj4+Cj4+PiB3aGlsZSB3
aXRoIHRoaXMgcGF0Y2ggdGhlIG91dHB1dCBpczoKPj4+Cj4+PiBjcHVfdG9wb2xvZ3kgICAgICAg
ICAgIDoKPj4+IGNwdTogICAgY29yZSAgICBzb2NrZXQgICAgIG5vZGUKPj4+ICAgMDogICAgICAg
MCAgICAgICAgMCAgICAgICAgMAo+Pj4gICAxOiAgICAgICAwICAgICAgICAwICAgICAgICAwCj4+
PiAgIDI6ICAgICAgIDEgICAgICAgIDAgICAgICAgIDAKPj4+ICAgMzogICAgICAgMSAgICAgICAg
MCAgICAgICAgMAo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0Bz
dXNlLmNvbT4KPj4gCj4+IFJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5j
b20+Cj4+IGZvciB4ODYuIEknZCBsaWtlIHRoaXMgdG8gaGF2ZSBhbiBBUk0gYWNrIGFzIHdlbGws
IHRob3VnaCwgZm9yCj4+IHRoZXJlIHBvc3NpYmx5IGJlaW5nIGRpZmZlcmVuY2VzIGluIGhvdyBj
cHVfcHJlc2VudF9tYXAgaXMKPj4gaGFuZGxlZCBpbiB0aGVpciBjYXNlLiBJbiBwYXJ0aWN1bGFy
IEkgbm90aWNlIHRoYXQgdGhlIG9ubHkgYWNjZXNzCj4+IHRvIHRoZSB2YXJpYWJsZSBpcyBpbiBz
bXBfcHJlcGFyZV9jcHVzKCkuCj4gCj4gSG93IHJlbGV2YW50IGlzIHRoYXQgaW5mb3JtYXRpb24g
Zm9yIGFybSBhdCBhbGw/Cj4gCj4gY3B1X3RvX2NvcmUoaSkgZXQgYWwgYWx3YXlzIHJldHVybiAw
LiBTbyB0b3BvbG9neSBpbmZvcm1hdGlvbiBpcyBub3QKPiByZWFsbHkgaGVscGZ1bC4KClN0ZWZh
bm8sIEp1bGllbj8KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
