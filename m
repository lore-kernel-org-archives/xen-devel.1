From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH SpectreV1+L1TF v7 4/9] nospec: introduce
 evaluate_nospec
Date: Fri, 22 Feb 2019 06:17:55 -0700
Message-ID: <5C6FF68302000078002192E8@prv1-mh.provo.novell.com>
References: <1550737003-25779-1-git-send-email-nmanthey@amazon.de>
 <1550737003-25779-5-git-send-email-nmanthey@amazon.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jjk+=Q5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gxAiE-0006Xp-6I
 for xen-devel@lists.xenproject.org; Fri, 22 Feb 2019 13:17:58 +0000
In-Reply-To: <1550737003-25779-5-git-send-email-nmanthey@amazon.de>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: nmanthey@amazon.de
Cc: Juergen Gross <jgross@suse.com>, Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Martin Pohlack <mpohlack@amazon.de>, wipawel@amazon.de, Julien Grall <julien.grall@arm.com>, David Woodhouse <dwmw@amazon.co.uk>, "Martin Mazein(amazein)" <amazein@amazon.de>, xen-devel <xen-devel@lists.xenproject.org>, Julian Stecklina <jsteckli@amazon.de>, Bjoern Doebel <doebel@amazon.de>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIxLjAyLjE5IGF0IDA5OjE2LCA8bm1hbnRoZXlAYW1hem9uLmRlPiB3cm90ZToKPiAt
LS0gL2Rldi9udWxsCj4gKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9ub3NwZWMuaAo+IEBAIC0w
LDAgKzEsMzggQEAKPiArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAgKi8KPiAr
LyogQ29weXJpZ2h0IDIwMTggQW1hem9uLmNvbSwgSW5jLiBvciBpdHMgYWZmaWxpYXRlcy4gQWxs
IFJpZ2h0cyBSZXNlcnZlZC4gKi8KPiArCj4gKyNpZm5kZWYgX0FTTV9YODZfTk9TUEVDX0gKPiAr
I2RlZmluZSBfQVNNX1g4Nl9OT1NQRUNfSAo+ICsKPiArI2luY2x1ZGUgPGFzbS9hbHRlcm5hdGl2
ZS5oPgo+ICsKPiArLyogQWxsb3cgdG8gaW5zZXJ0IGEgcmVhZCBtZW1vcnkgYmFycmllciBpbnRv
IGNvbmRpdGlvbmFscyAqLwo+ICtzdGF0aWMgYWx3YXlzX2lubGluZSBib29sIGJhcnJpZXJfbm9z
cGVjX3RydWUodm9pZCkKPiArewo+ICsjaWZkZWYgQ09ORklHX0hWTQo+ICsgICAgYWx0ZXJuYXRp
dmUoIiIsICJsZmVuY2UiLCBYODZfRkVBVFVSRV9TQ19MMVRGX1ZVTE4pOwo+ICsjZW5kaWYKPiAr
ICAgIHJldHVybiB0cnVlOwo+ICt9Cj4gKwo+ICsvKiBBbGxvdyB0byBwcm90ZWN0IGV2YWx1YXRp
b24gb2YgY29uZGl0aW9uYXNsIHdpdGggcmVzcGVjdCB0byBzcGVjdWxhdGlvbiAqLwo+ICsjaWZk
ZWYgQ09ORklHX0hWTQo+ICsjZGVmaW5lIGV2YWx1YXRlX25vc3BlYyhjb25kaXRpb24pICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gKyAgICAoKGNvbmRpdGlvbikg
PyBiYXJyaWVyX25vc3BlY190cnVlKCkgOiAhYmFycmllcl9ub3NwZWNfdHJ1ZSgpKQo+ICsjZWxz
ZQo+ICsjZGVmaW5lIGV2YWx1YXRlX25vc3BlYyhjb25kaXRpb24pIChjb25kaXRpb24pCj4gKyNl
bmRpZgo+ICsKPiArLyogQWxsb3cgdG8gYmxvY2sgc3BlY3VsYXRpdmUgZXhlY3V0aW9uIGluIGdl
bmVyaWMgY29kZSAqLwo+ICsjZGVmaW5lIGJsb2NrX3NwZWN1bGF0aW9uKCkgKCh2b2lkKWJhcnJp
ZXJfbm9zcGVjX3RydWUoKSkKClNlZWluZyBKdWxpZW4ncyByZXF1ZXN0IGZvciBzd2l0Y2hpbmcg
dG8gaW5saW5lIGZ1bmN0aW9ucyBvbiB0aGUgQXJtIHNpZGUsCmlzIHRoZXJlIGFueXRoaW5nIHBy
ZXZlbnRpbmcgdGhlc2UgdHdvIHRvIGJlY29tZSBpbmxpbmUgZnVuY3Rpb25zIHRvbz8KCkphbgoK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
