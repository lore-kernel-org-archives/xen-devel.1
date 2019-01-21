From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3 7/7] xen/dom0: Add a dom0-iommu=none
 option
Date: Mon, 21 Jan 2019 18:08:59 +0000
Message-ID: <2d2838b7-4628-3e8c-0b78-07fc1c8eeefb@citrix.com>
References: <1547629250-1405-1-git-send-email-andrew.cooper3@citrix.com>
 <1547629250-1405-8-git-send-email-andrew.cooper3@citrix.com>
 <5C4084B7020000780020EB1D@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5C4084B7020000780020EB1D@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Julien Grall <julien.grall@arm.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTcvMDEvMjAxOSAxMzozNSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMTYuMDEuMTkg
YXQgMTA6MDAsIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPj4gQEAgLTcwOSw2
ICs3MDksMTIgQEAgQ29udHJvbHMgZm9yIHRoZSBkb20wIElPTU1VIHNldHVwLgo+PiAgICAgIFRo
aXMgb3B0aW9uIGlzIGVuYWJsZWQgYnkgZGVmYXVsdCBvbiB4ODYgc3lzdGVtcywgYW5kIGludmFs
aWQgb24gQVJNCj4+ICAgICAgc3lzdGVtcy4KPj4gIAo+PiArKiAgIFRoZSBgbm9uZWAgb3B0aW9u
IGlzIGludGVuZGVkIGZvciBkZXZlbG9wbWVudCBwdXJwb3NlcyBvbmx5LCBhbmQgc2tpcHMKPj4g
KyAgICBjZXJ0YWluIHNhZmV0eSBjaGVja3MgcGVydGFpbmluZyB0byB0aGUgY29ycmVjdCBJT01N
VSBjb25maWd1cmF0aW9uIGZvcgo+PiArICAgIGRvbTAgdG8gYm9vdC4KPiBXb3VsZCB5b3UgbWlu
ZCBpbnNlcnRpbmcgIlBWSCIgYWhlYWQgb2YgImRvbTAiPwoKVGhhdCB3b3VsZCByZXN1bHQgaW4g
YW4gaW5hY2N1cmF0ZSBkZXNjcmlwdGlvbiBvZiB0aGUgZnVuY3Rpb25hbGl0eS7CoApjaGVja19o
d2RvbV9yZXFzKCkgaXMgbm90IHNwZWNpZmljIHRvIFBWSCBndWVzdHMuCgo+Cj4+IEBAIC0xNTYs
NyArMTU5LDcgQEAgaW50IGlvbW11X2RvbWFpbl9pbml0KHN0cnVjdCBkb21haW4gKmQpCj4+ICAK
Pj4gIHN0YXRpYyB2b2lkIF9faHdkb21faW5pdCBjaGVja19od2RvbV9yZXFzKHN0cnVjdCBkb21h
aW4gKmQpCj4+ICB7Cj4+IC0gICAgaWYgKCAhcGFnaW5nX21vZGVfdHJhbnNsYXRlKGQpICkKPj4g
KyAgICBpZiAoIGlvbW11X2h3ZG9tX25vbmUgfHwgIXBhZ2luZ19tb2RlX3RyYW5zbGF0ZShkKSAp
Cj4+ICAgICAgICAgIHJldHVybjsKPiBTZWVpbmcgdGhlIF9faHdkb21faW5pdCwgd291bGRuJ3Qg
aXQgYmUgYmV0dGVyIHRvIHJlc3RyaWN0IHRoaXMKPiByZWxheGF0aW9uIHRvIFhlbiBib290IHRp
bWUgY3JlYXRlZCBEb20wPwoKTm8sIEkgZG9uJ3QgdGhpbmsgc28uCgpUaGF0IHdvdWxkIGNvbXBs
aWNhdGUgdGhlIGNoYW5nZSAod2hpY2ggaXMgYWxyZWFkeSBvbmx5IGZvciB1c2UgYnkKZGV2ZWxv
cGVycyksIGFuZCB1bm5lY2Vzc2FyaWx5IHByb2hpYml0IHRlc3Rpbmcgb2YgdGhlIGxhdGUgaHdk
b20gcGF0aHMuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
