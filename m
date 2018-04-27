From: Lars Kurth <lars.kurth@citrix.com>
Subject: Re: [PATCH v1 1/2] Add new add_maintainers.pl script to
 optimise the workflow when using git format-patch with get_maintainer.pl
Date: Fri, 27 Apr 2018 12:06:24 +0000
Message-ID: <19EFA617-3081-4C2B-B26C-CBAE8479ECB8@citrix.com>
References: <cover.1524821286.git.lars.kurth@citrix.com>
 <b42b055e1367432d7fc6b107c59781c1c505a1c0.1524821286.git.lars.kurth@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=zty4=hq=citrix.com=prvs=6486f50cc=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1fC29Y-0008RN-JS
 for xen-devel@lists.xenproject.org; Fri, 27 Apr 2018 12:07:04 +0000
In-Reply-To: <b42b055e1367432d7fc6b107c59781c1c505a1c0.1524821286.git.lars.kurth@citrix.com>
Content-Language: en-US
Content-ID: <0854382268514347AD2B5CB7C93DB53F@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, George Dunlap <George.Dunlap@citrix.com>, Tim Deegan <tim@xenproject.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Anthony Perard <anthony.perard@citrix.com>, Ian Jackson <Ian.Jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

QWRkZWQgQW50aG9ueSBhcyBoZSBoaWdobGlnaHRlZCB0aGUgaXNzdWUgd2hpY2ggbGVkIHRvIHRo
ZSBjcmVhdGlvbiBvZiB0aGUgdG9vbA0KT3RoZXJ3aXNlIEkgcGxheWVkIGEgbGl0dGxlIGJpdCBt
b3JlIG9uIHZhcmlvdXMgc2VyaWVzIEkgd29ya2VkIG9uIGluIHRoZSBwYXN0IGFuZCB0aGVyZSBh
cmUgbWlub3IgbmlnZ2xlcyBpbiBpdHMgdXNhZ2UNCg0K77u/T24gMjcvMDQvMjAxOCwgMTA6MzEs
ICJMYXJzIEt1cnRoIiA8bGFycy5rdXJ0aEBjaXRyaXguY29tPiB3cm90ZToNCiAgICANCiAgICAr
T1BUSU9OUzoNCiAgICArLS0tLS0tLS0NCiAgICArICAtLXB8cHJlZml4IChlLmcuIC0tcHJlZml4
IHYyKQ0KICAgICsgICAgQ2hvb3NlIHBhdGNoIGZpbGVzIHdpdGggYSBzcGVjaWZpYyBwcmVmaXgN
Cg0KSSBhbSB0aGlua2luZyBvZiByZW5hbWluZyB0aGlzIHRvIC0tcnxyZXJvbGwtY291bnQ9PG51
bWJlcj4gYXMgdGhpcyB3b3VsZCBtYWtlIHRoZSB0b29sIG1vcmUNCmNvbnNpc3RlbnQgd2l0aCBn
aXQgZm9ybWF0LXBhdGNoIGFuZCB3b3VsZCBtYWtlIGF1dG9tYXRpb24gZWFzaWVyDQoNCiAgICAr
ICAtLWF8YXJncw0KICAgICsgICAgQXJndW1lbnRzIHBhc3NlZCBvbiB0byAkZ2V0X21haW50YWlu
ZXINCiAgICArICAtLXZ8dmVyYm9zZQ0KICAgICsgICAgU2hvdyBtb3JlIG91dHB1dA0KICAgICsg
IC0tdmVyc2lvbg0KICAgICsgICAgU2hvdyB2ZXJzaW9uDQogICAgKyAgLS1vfG92ZXJ3cml0ZQ0K
ICAgICsgICAgT3ZlcndyaXRlcyAqLnBhdGNoIGZpbGUgKGJ1dCBtYWtlcyBhIGJhY2t1cCksIHdo
ZXJlYXMgdGVoIGRlZmF1bHQNCiAgICArICAgIGNyZWF0ZXMgYSBuZXcgKi5tcGF0Y2ggZmlsZQ0K
DQpJIHRoaW5rIEkgd2lsbCBtYWtlIC1vIHRoZSBkZWZhdWx0LCBhcyBvbmNlIHlvdSBnZXQgdXNl
ZCB0byB0aGUgdG9vbCB0aGUgcmVuYW1pbmcgb2YgZmlsZXMgaXMgYSBsaXR0bGUgYW5ub3lpbmcu
DQpBbHNvLCBpbnN0ZWFkIG9mIHVzaW5nIC0tbm9vdmVyd3JpdGUsIEkgd2FzIHRoaW5raW5nIG9m
IGNhbm5pbmcgLS1vdmVyd3JpdGUgYWx0b2dldGhlcg0KYW5kIHJlcGxhY2luZyBpdCBieSAtLWRy
eS1ydW4gYXMgdGhpcyBpcyBjb25zaXN0ZW50IHdpdGggZ2l0IHNlbmQtbWFpbC4gSW4gdGhhdCBj
YXNlLCB0aGUgKi5wYXRjaG0gZmlsZXMgZ2V0IA0KY3JlYXRlZCBhbmQgY2FuIGJlIGxvb2tlZCBh
dCwgYnkgdGhvc2Ugd2hpY2ggYXJlIGxlc3MgY29uZmlkZW50Lg0KDQpNYXliZSBhZGQgYSB3YXJu
aW5nIG9yIGEgdXNlciBwcm9tcHQsIHdoZW4gYW4gZXhpc3RpbmcgKi5wYXRjaH4gZmlsZSB3b3Vs
ZCBiZSBvdmVyd3JpdHRlbiwgdG8gcHJldmVudA0KYWNjaWRlbnRhbCBhcHBsaWNhdGlvbiBvZiB0
aGUgdG9vbCAod2hlbiB0aGF0IGhhZCBhbHJlYWR5IGJlZW4gZG9uZSkuIFR5cGljYWxseSwgdGhp
cyBjb3VsZCBoYXBwZW4gd2hlbg0KeW91IHN0b3JlIHNldmVyYWwgcGF0Y2ggdmVyc2lvbnMgaW4g
b25lIGRpcmVjdG9yeSBhbmQgZm9yZ2V0IHRoZSAtLXByZWZpeCBvcHRpb24uIFRoaXMgd291bGQg
YWxzbyBwcm9tcHQNCmEgd2FybmluZyBpZiBzb21lb25lIGhhZCBtYW51YWxseSBlZGl0ZWQgdGhl
IGZpbGUgd2l0aCBhbiBlZGl0b3IgdGhhdCBjcmVhdGVzIGEgYmFja3VwICh3aGljaCBtYW55IGRv
DQp2aWEgfikuDQoNCkFueSB2aWV3cz8NCg0KQ2hlZXJzDQpMYXJzICAgIA0KDQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
