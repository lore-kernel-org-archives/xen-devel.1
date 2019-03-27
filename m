From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3 01/14] x86/cpu: Create Hygon Dhyana
 architecture support file
Date: Wed, 27 Mar 2019 02:30:52 -0600
Message-ID: <5C9B34BC0200007800222113@prv1-mh.provo.novell.com>
References: <cover.1553520193.git.puwen@hygon.cn>
 <14dcae729e8d2ed9ba54565a61e027c83b9df529.1553520193.git.puwen@hygon.cn>
 <5C9A49DA0200007800221F7F@prv1-mh.provo.novell.com>
 <f8aa80d5-5a5e-b8b9-932b-bc9310f75a59@hygon.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=0tC/=R6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h93xW-0006IV-9R
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2019 08:30:54 +0000
In-Reply-To: <f8aa80d5-5a5e-b8b9-932b-bc9310f75a59@hygon.cn>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Pu Wen <puwen@hygon.cn>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI3LjAzLjE5IGF0IDA5OjE0LCA8cHV3ZW5AaHlnb24uY24+IHdyb3RlOgo+IE9uIDIw
MTkvMy8yNiAyMzo0OSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDI1LjAzLjE5IGF0IDE0OjI5
LCA8cHV3ZW5AaHlnb24uY24+IHdyb3RlOgo+Pj4gQEAgLTExNiw2ICsxMjEsOSBAQCBib29sIF9f
aW5pdCBwcm9iZV9jcHVpZF9mYXVsdGluZyh2b2lkKQo+Pj4gICAJdWludDY0X3QgdmFsOwo+Pj4g
ICAJaW50IHJjOwo+Pj4gICAKPj4+ICsJaWYoYm9vdF9jcHVfZGF0YS54ODZfdmVuZG9yID09IFg4
Nl9WRU5ET1JfSFlHT04pCj4+PiArCQlyZXR1cm4gZmFsc2U7Cj4+PiArCj4+PiAgIAlpZiAoKHJj
ID0gcmRtc3Jfc2FmZShNU1JfSU5URUxfUExBVEZPUk1fSU5GTywgdmFsKSkgPT0gMCkKPj4gCj4+
IElzbid0IHRoaXMgc2ltaWxhcmx5IHRydWUgZm9yIEFNRCwgaW4gd2hpY2ggY2FzZSBhZGRpbmcg
Ym90aCBhdCB0aGUKPiAKPiBUaGVyZSBpcyBubyBNU1JfSU5URUxfUExBVEZPUk1fSU5GTyBmb3Ig
QU1EIGZhbWlseSAxN2ggYW5kIEh5Z29uIGZhbWlseQo+IDE4aC4gUmVhZGluZyB0aGlzIE1TUiB3
aWxsIHN0YWxsIG9uIEh5Z29uIHN5c3RlbS4gSSBkb24ndCBrbm93IGlmIGl0Cj4gd291bGQgc3Vj
Y2Vzc2Z1bGx5IHJldHVybmVkIHdoZW4gcmVhZGluZyBpdCBvbiBBTUQgc3lzdGVtLgoKV2hhdCBk
byB5b3UgbWVhbiBieSAic3RhbGwiPyBSZWFkaW5nIGFuIHVuaW1wbGVtZW50ZWQgTVNSCnNob3Vs
ZCBwcm9kdWNlICNHUCgwKS4KCj4+IHNhbWUgdGltZSBpbiBhIHNlcGFyYXRlIHBhdGNoIHdvdWxk
IHNlZW0gYmV0dGVyPyBZZXQgdGhlbiBhZ2FpbiAtCj4gCj4gSW4gYSBzZXBhcmF0ZSBwYXRjaCBp
cyBmaW5lLgo+IAo+PiBkaWQgeW91IGxvb2sgYXQgdGhlIGRlc2NyaXB0aW9uIG9mIHRoZSBjb21t
aXQgbW92aW5nIHRoZSBmdW5jdGlvbgo+PiBoZXJlICg2ZTJmZGMwZjg5IFsieDg2OiBDb21tb24g
Y3B1aWQgZmF1bHRpbmcgc3VwcG9ydCJdKT8gSGVuY2UKPj4gaWYgYW55dGhpbmcgdGhpcyB3b3Vs
ZCBuZWVkIHF1YWxpZnlpbmcgYnkgIWNwdV9oYXNfaHlwZXJ2aXNvci4KPiAKPiBUaGVuIGl0IHdv
dWxkIGJlIGxpa2UgdGhpczoKPiAJaWYgKGJvb3RfY3B1X2RhdGEueDg2X3ZlbmRvciA9PSBYODZf
VkVORE9SX0hZR09OICYmCj4gCSAgICAhY3B1X2hhc19oeXBlcnZpc29yKQo+IAkJcmV0dXJuIGZh
bHNlOwoKUmlnaHQsIHBsdXMgcGVyaGFwcyBzYWlkIEFNRCBhZGRpdGlvbiwgdW5sZXNzIEFuZHJl
dyBvYmplY3RzIHRvIGl0CmZvciBzb21lIHJlYXNvbi4KCkphbgoKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
