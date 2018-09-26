From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 03/11] vpci: add tear down functions
Date: Wed, 26 Sep 2018 04:50:59 -0600
Message-ID: <5BAB649302000078001EC1CA@prv1-mh.provo.novell.com>
References: <20180717094830.54806-1-roger.pau@citrix.com>
 <20180717094830.54806-4-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=an3h=mi=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g57PK-0000ae-AD
 for xen-devel@lists.xenproject.org; Wed, 26 Sep 2018 10:51:02 +0000
In-Reply-To: <20180717094830.54806-4-roger.pau@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE3LjA3LjE4IGF0IDExOjQ4LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IC0tLSBhL3hlbi9kcml2ZXJzL3ZwY2kvdnBjaS5jCj4gKysrIGIveGVuL2RyaXZlcnMvdnBjaS92
cGNpLmMKPiBAQCAtMzEsMTQgKzMxLDI2IEBAIHN0cnVjdCB2cGNpX3JlZ2lzdGVyIHsKPiAgfTsK
PiAgCj4gICNpZmRlZiBfX1hFTl9fCj4gLWV4dGVybiB2cGNpX3JlZ2lzdGVyX2luaXRfdCAqY29u
c3QgX19zdGFydF92cGNpX2FycmF5W107Cj4gLWV4dGVybiB2cGNpX3JlZ2lzdGVyX2luaXRfdCAq
Y29uc3QgX19lbmRfdnBjaV9hcnJheVtdOwo+ICtleHRlcm4gY29uc3Qgc3RydWN0IHZwY2lfaGFu
ZGxlciBfX3N0YXJ0X3ZwY2lfYXJyYXlbXTsKPiArZXh0ZXJuIGNvbnN0IHN0cnVjdCB2cGNpX2hh
bmRsZXIgX19lbmRfdnBjaV9hcnJheVtdOwo+ICAjZGVmaW5lIE5VTV9WUENJX0lOSVQgKF9fZW5k
X3ZwY2lfYXJyYXkgLSBfX3N0YXJ0X3ZwY2lfYXJyYXkpCj4gIAo+ICBzdGF0aWMgdm9pZCB2cGNp
X3JlbW92ZV9kZXZpY2VfbG9ja2VkKHN0cnVjdCBwY2lfZGV2ICpwZGV2KQo+ICB7Cj4gKyAgICB1
bnNpZ25lZCBpbnQgaTsKPiArCj4gICAgICBBU1NFUlQoc3Bpbl9pc19sb2NrZWQoJnBkZXYtPnZw
Y2lfbG9jaykpOwo+ICAKPiArICAgIGZvciAoIGkgPSAwOyBpIDwgTlVNX1ZQQ0lfSU5JVDsgaSsr
ICkKPiArICAgIHsKPiArICAgICAgICB2cGNpX3RlYXJkb3duX3QgKnRlYXJkb3duID0KPiArICAg
ICAgICAgICAgX19zdGFydF92cGNpX2FycmF5W05VTV9WUENJX0lOSVQgLSBpIC0gMV0udGVhcmRv
d247CgpQZXJoYXBzIHNsaWdodGx5IGVhc2llciB0byByZWFkIGlmIHlvdSBtYWRlIHRoZSBsb29w
IGNvdW50IGRvd253YXJkcz8KCj4gICNkZWZpbmUgVlBDSV9QUklPUklUWV9ISUdIICAgICAgIjEi
Cj4gICNkZWZpbmUgVlBDSV9QUklPUklUWV9NSURETEUgICAgIjUiCj4gICNkZWZpbmUgVlBDSV9Q
UklPUklUWV9MT1cgICAgICAgIjkiCj4gIAo+IC0jZGVmaW5lIFJFR0lTVEVSX1ZQQ0lfSU5JVCh4
LCBwKSAgICAgICAgICAgICAgICBcCj4gLSAgc3RhdGljIHZwY2lfcmVnaXN0ZXJfaW5pdF90ICpj
b25zdCB4IyNfZW50cnkgIFwKPiAtICAgICAgICAgICAgICAgX191c2VkX3NlY3Rpb24oIi5kYXRh
LnZwY2kuIiBwKSA9IHgKPiArI2RlZmluZSBSRUdJU1RFUl9WUENJX0lOSVQoaSwgdCwgcCkgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ICsgIGNvbnN0IHN0YXRpYyBzdHJ1
Y3QgdnBjaV9oYW5kbGVyIGkgIyMgdCAjIyBfZW50cnkgICAgICAgICAgICAgICAgICAgICBcCgpQ
bGVhc2UgZmxpcCBzdGF0aWMgYW5kIGNvbnN0LiBJaXJjIHdlIGhhZCBhIGNhc2UgaW4gdGhlIHBh
c3Qgd2hlcmUgc29tZQp0b29sIChwZXJoYXBzIG5vdCBhIGNvbXBpbGVyIGJ1dCBhbiBhbmFseXNp
cyB0b29sKSBjaG9rZWQgYWJvdXQgdGhpcwp1bmNvbW1vbiBvcmRlcmluZy4KCldpdGggdGhlc2Ug
dGFrZW4gY2FyZSBvZgpBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoK
SmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
