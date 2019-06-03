From: chenbaodong <chenbaodong@mxnavi.com>
Subject: Re: [PATCH RESEND] xen: notifier: refine
 'notifier_head', use 'list_head' directly
Date: Mon, 3 Jun 2019 18:00:18 +0800
Message-ID: <64a7b056-d6ab-45cd-292a-1ecb9823d2c5@mxnavi.com>
References: <735ee4900c5054a558c1cb7c3b6d7e9a@sslemail.net>
 <5CF4E7E702000078002347A9@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WQxh=UC=mxnavi.com=chenbaodong@srs-us1.protection.inumbo.net>)
 id 1hXjlS-0005ll-8d
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 10:00:26 +0000
In-Reply-To: <5CF4E7E702000078002347A9@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Ck9uIDYvMy8xOSAxNzoyNywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMDMuMDYuMTkgYXQg
MDM6MzMsIDxjaGVuYmFvZG9uZ0BteG5hdmkuY29tPiB3cm90ZToKPj4gJ25vdGlmaWVyX2Jsb2Nr
JyBjYW4gYmUgcmVwbGFjZWQgd2l0aCAnbGlzdF9oZWFkJyB3aGVuIHVzZWQgZm9yCj4+ICdub3Rp
Zmllcl9oZWFkJywgdGhpcyBtYWtlIHRoZSBhIGxpdHRsZSBtb3JlIGNsZWFyLgo+IEkgZ3Vlc3Mg
eW91IG1lYW4gIi4uLiBtYWtlcyB0aGUgY29kZSBhIGxpdHRsZSAuLi4iPwpZZXMsIGZpeGVkLCBz
ZWUgdjEuCj4+IEBAIC03MSwxNiArNzEsMTYgQEAgaW50IG5vdGlmaWVyX2NhbGxfY2hhaW4oCj4+
ICAgewo+PiAgICAgICBpbnQgcmV0ID0gTk9USUZZX0RPTkU7Cj4+ICAgICAgIHN0cnVjdCBsaXN0
X2hlYWQgKmN1cnNvcjsKPj4gLSAgICBzdHJ1Y3Qgbm90aWZpZXJfYmxvY2sgKm5iOwo+PiArICAg
IHN0cnVjdCBub3RpZmllcl9ibG9jayAqbmIgPSBOVUxMOwo+PiAgICAgICBib29sX3QgcmV2ZXJz
ZSA9ICEhKHZhbCAmIE5PVElGWV9SRVZFUlNFKTsKPj4gICAKPj4gLSAgICBjdXJzb3IgPSAmKHBj
dXJzb3IgJiYgKnBjdXJzb3IgPyAqcGN1cnNvciA6ICZuaC0+aGVhZCktPmNoYWluOwo+PiArICAg
IGN1cnNvciA9IChwY3Vyc29yICYmICpwY3Vyc29yID8gJigqcGN1cnNvciktPmNoYWluIDogJm5o
LT5oZWFkKTsKPiBUaGUgb3V0ZXJtb3N0IHBhcmVudGhlc2VzIGFyZSBub3cgbm90IHJlYWxseSBu
ZWVkZWQgYW55bW9yZS4KWWVzLCBmaXhlZCwgc2VlIHYxLgo+Cj4+IC0tLSBhL3hlbi9pbmNsdWRl
L3hlbi9ub3RpZmllci5oCj4+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9ub3RpZmllci5oCj4+IEBA
IC0yOSwxMyArMjksMTIgQEAgc3RydWN0IG5vdGlmaWVyX2Jsb2NrIHsKPj4gICB9Owo+PiAgIAo+
PiAgIHN0cnVjdCBub3RpZmllcl9oZWFkIHsKPj4gLSAgICBzdHJ1Y3Qgbm90aWZpZXJfYmxvY2sg
aGVhZDsKPj4gKyAgICBzdHJ1Y3QgbGlzdF9oZWFkIGhlYWQ7Cj4+ICAgfTsKPj4gICAKPj4gLSNk
ZWZpbmUgTk9USUZJRVJfSU5JVChuYW1lKSB7IC5oZWFkLmNoYWluID0gTElTVF9IRUFEX0lOSVQo
bmFtZS5oZWFkLmNoYWluKSB9Cj4gTm90ZSB0aGUgYmxhbmtzIGltbWVkaWF0ZWx5IGluc2lkZSB0
aGUgZmlndXJlIGJyYWNlcyAtIC4uLgpZZXMsIGZpeGVkLCBzZWUgdjEuCj4KPj4gKyNkZWZpbmUg
Tk9USUZJRVJfSEVBRChuYW1lKSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBcCj4+ICsgIHN0cnVjdCBub3RpZmllcl9oZWFkIG5hbWUgPSB7LmhlYWQg
PSBMSVNUX0hFQURfSU5JVChuYW1lLmhlYWQpfQo+IC4uLiBwbGVhc2UgZG9uJ3QgYnJlYWsgc3Vj
aCBzdHlsZSBhc3BlY3RzLCB1bmxlc3MgeW91IGtub3cKPiBpdCBpcyBzb21ldGhpbmcgdGhhdCBu
ZWVkcyBmaXhpbmcgKGZvciBiZWluZyBpbiB2aW9sYXRpb24gb2Ygb3VyCj4gc3R5bGUgZ3VpZGVs
aW5lcykuClllcywgZml4ZWQsIHNlZSB2MS4KPgo+IEphbgo+Cj4KPiAuCj4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
