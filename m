From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3 4/4] xen: use SYMBOL everywhere
Date: Fri, 09 Nov 2018 00:07:01 -0700
Message-ID: <5BE5321502000078001F9FF4@prv1-mh.provo.novell.com>
References: <alpine.DEB.2.10.1811061403440.21987@sstabellini-ThinkPad-X260>
 <1541541959-23140-4-git-send-email-sstabellini@kernel.org>
 <5BE44D6802000078001F9B77@prv1-mh.provo.novell.com>
 <alpine.DEB.2.10.1811081425170.20890@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=mulf=nu=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gL0sj-0004Bq-UV
 for xen-devel@lists.xenproject.org; Fri, 09 Nov 2018 07:07:05 +0000
In-Reply-To: <alpine.DEB.2.10.1811081425170.20890@sstabellini-ThinkPad-X260>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <stefanos@xilinx.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA4LjExLjE4IGF0IDIzOjI3LCA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6
Cj4gT24gVGh1LCA4IE5vdiAyMDE4LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gPj4+IE9uIDA2LjEx
LjE4IGF0IDIzOjA1LCA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6Cj4+ID4gLS0tCj4+
ID4gIHhlbi9hcmNoL2FybS9hbHRlcm5hdGl2ZS5jICAgICAgICAgIHwgIDcgKystLQo+PiA+ICB4
ZW4vYXJjaC9hcm0vYXJtMzIvbGl2ZXBhdGNoLmMgICAgICB8ICAyICstCj4+ID4gIHhlbi9hcmNo
L2FybS9hcm02NC9saXZlcGF0Y2guYyAgICAgIHwgIDIgKy0KPj4gPiAgeGVuL2FyY2gvYXJtL2Rv
bWFpbl9idWlsZC5jICAgICAgICAgfCAgMiArLQo+PiA+ICB4ZW4vYXJjaC9hcm0vbGl2ZXBhdGNo
LmMgICAgICAgICAgICB8ICA2ICstLQo+PiA+ICB4ZW4vYXJjaC9hcm0vbW0uYyAgICAgICAgICAg
ICAgICAgICB8IDE3ICsrKystLS0tCj4+ID4gIHhlbi9hcmNoL2FybS9zZXR1cC5jICAgICAgICAg
ICAgICAgIHwgIDggKystLQo+PiA+ICB4ZW4vYXJjaC94ODYvc2V0dXAuYyAgICAgICAgICAgICAg
ICB8IDc5ICsrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0KPj4gPiAgeGVuL2Fy
Y2gveDg2L3Rib290LmMgICAgICAgICAgICAgICAgfCAxMiArKystLS0KPj4gPiAgeGVuL2FyY2gv
eDg2L3g4Nl82NC9tYWNoaW5lX2tleGVjLmMgfCAgNCArLQo+PiA+ICB4ZW4vZHJpdmVycy92cGNp
L3ZwY2kuYyAgICAgICAgICAgICB8ICA3ICsrKy0KPj4gPiAgeGVuL2luY2x1ZGUvYXNtLWFybS9n
cmFudF90YWJsZS5oICAgfCAgMyArLQo+PiA+ICB4ZW4vaW5jbHVkZS9hc20tYXJtL21tLmggICAg
ICAgICAgICB8ICA0ICstCj4+ID4gIHhlbi9pbmNsdWRlL2FzbS14ODYvbW0uaCAgICAgICAgICAg
IHwgIDQgKy0KPj4gPiAgeGVuL2luY2x1ZGUveGVuL2tlcm5lbC5oICAgICAgICAgICAgfCAyNCAr
KysrKy0tLS0tLQo+PiA+ICAxNSBmaWxlcyBjaGFuZ2VkLCA5NyBpbnNlcnRpb25zKCspLCA4NCBk
ZWxldGlvbnMoLSkKPj4gCj4+IEp1c3QgbGlrZSBmb3IgdjI6IERpZCB5b3UgcmVhbGx5IGNoZWNr
IHlvdSBjYXVnaHQgdGhlbSBhbGw/IFRoZSB2UENJCj4+IG9uZXMgSSBoYWQgcG9pbnRlZCBhdCBi
YWNrIHRoZW4gd2VyZSBvbmx5IGFuIGV4YW1wbGUuIEFub3RoZXIKPj4gZXhhbXBsZSBub3cgaXMg
eGVuL2NvbW1vbi9rZXJuZWwuYzpfY21kbGluZV9wYXJzZSgpLgo+IAo+IEl0IGlzIGRpZmZpY3Vs
dCB0byBjYXRjaCB0aGVtIGFsbC4gQW55IHN1Z2dlc3Rpb24gb24gaG93IHRvIG1ha2Ugc3VyZQo+
IHRoZXJlIGFyZSBubyBsZWZ0b3ZlciAob3RoZXIgdGhhbiB3YWl0aW5nIGZvciB0aGUgbmV4dCBR
QVZlcmlmeSBzY2FuKT8KCkZpcnN0IGFuIGZvcmVtb3N0IGdvIHRocm91Z2ggYWxsIHN5bWJvbHMg
Z2VuZXJhdGVkIGJ5IGxpbmtlciBzY3JpcHRzLgpNb3N0IGlmIG5vdCBhbGwgd2lsbCBib3VuZCBl
aXRoZXIgc2lkZSBvZiBhIHNlY3Rpb24uCgo+IE1heWJlLCBJIHNob3VsZCBqdXN0IHJlbW92ZSB0
aGUgd29yZCAiZXZlcnl3aGVyZSIgZnJvbSB0aGUgY29tbWl0Cj4gbWVzc2FnZT8KClRoYXQgd291
bGQgaGVscCB0b28sIHRvZ2V0aGVyIHdpdGggZW51bWVyYXRpbmcgd2hhdCBwYXR0ZXJucwp5b3Un
dmUgbG9va2VkIGZvci4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
