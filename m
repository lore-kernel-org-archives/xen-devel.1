From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 10/13] libx86: introduce a helper to
 deserialise msr_policy objects
Date: Tue, 17 Jul 2018 17:06:35 +0100
Message-ID: <be311d0f-d994-e4b3-7b68-25f308813a22@citrix.com>
References: <1531512194-6865-1-git-send-email-andrew.cooper3@citrix.com>
 <1531512194-6865-11-git-send-email-andrew.cooper3@citrix.com>
 <5B4C835902000078001D4569@prv1-mh.provo.novell.com>
 <f8ad62da-d243-64c4-6a97-f074996a6371@citrix.com>
 <5B4DDA8602000078001D4DCA@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5B4DDA8602000078001D4DCA@prv1-mh.provo.novell.com>
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
Cc: Ian Jackson <Ian.Jackson@citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Sergey Dyasli <sergey.dyasli@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTcvMDcvMTggMTM6MDEsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+ICsgICAgICAgICAgICAg
ICAgZ290byBlcnI7Cj4+Pj4gKwo+Pj4+ICsgICAgICAgICAgICBwLT5wbGFmb3JtX2luZm8ucmF3
ID0gZGF0YS52YWw7Cj4+PiBObyBvdGhlciBzYW5pdHkgY2hlY2tpbmc/Cj4+IENvcnJlY3QuICBU
aGlzIGlzIGEgZGF0YSBtYXJzaGFsbGluZyBmdW5jdGlvbiwgbm90IGFuIGF1ZGl0aW5nIGZ1bmN0
aW9uLgo+Pgo+PiBUaGUgYXVkaXRpbmcgZnVuY3Rpb25zIGFyZSBhbHNvIG5lZWRlZCBmb3IgaW4t
cGxhY2UgbW9kaWZpY2F0aW9uIHRvIGFuCj4+IGV4aXN0aW5nIHBvbGljeS4KPiBSaWdodCwgYnV0
IHRoZSBwcmltYXJ5IHByb2JsZW0gd2l0aCB1bmRlcnN0YW5kaW5nIHdoZXRoZXIgdGhlIGxhY2sK
PiBvZiBjaGVja2luZyBoZXJlIGlzIGEgcHJvYmxlbSBpcyB0aGUgbGFjayBvZiBhIGNhbGxlciBv
ZiB0aGlzIGZ1bmN0aW9uLgoKVGhlIHJlYXNvbiB0aGVyZSBpcyBubyBjYWxsZXIgaXMgYmVjYXVz
ZSB5b3Ugb2JqZWN0ZWQgdG8gbXkgc3R1YgppbXBsZW1lbnRhdGlvbiBpbiB2MS4KClRoaXMgbWFy
c2hhbGxpbmcgc3VwcG9ydCBpcyBjdXJyZW50bHkgYmxvY2tpbmcgb3RoZXIgd29yaywgd2hpY2gg
aXMgd2h5CkkndmUgc3BsaXQgaXQgb3V0LCB0byBhbGxvdyBkZXZlbG9wbWVudCB0byBjb250aW51
ZSBpbiBwYXJhbGxlbC4KCj4gQXMgSSB0aGluayBJIGRpZCBzYXkgaW4gdGhlIGVhcmxpZXIgcmVw
bHkgLSBpdCBtYXR0ZXJzIHF1aXRlIGEgYml0IHdoZXJlIHAKPiBwb2ludHMuCgpObyAtIGl0IGRv
ZXNuJ3QuwqAgVGhpcyBpcyBhIGZ1bmN0aW9uIHRvIGNvbnZlcnQgZGF0YSBiZXR3ZWVuIHR3byBi
aW5hcnkKcmVwcmVzZW50YXRpb25zLCBhcyBpcyBleHBsYWluZWQgYnkgaXRzIGRvY3VtZW50YXRp
b24uCgpBdWRpdGluZyB0aGUgY29udGVudHMgb2YgdGhlIGRhdGEgd291bGQgYSkgbmVlZCB0byBo
YXBwZW4gaW4gY29tYmluYXRpb24Kd2l0aCBhIGNwdWlkX3BvbGljeSBvYmplY3QsIGFuZCBiKSB3
b3VsZCBiZSBhIGxheWVyaW5nIHZpb2xhdGlvbi4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
