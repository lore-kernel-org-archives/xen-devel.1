From: Sergey Dyasli <sergey.dyasli@citrix.com>
Subject: Re: [PATCH v1] x86/microcode: always collect_cpu_info()
 during boot
Date: Mon, 1 Apr 2019 11:19:19 +0100
Message-ID: <b33556d4-5911-d0c6-9663-3e8f4eed79f8@citrix.com>
References: <20190325111217.25649-1-sergey.dyasli@citrix.com>
 <5C990B220200007800221BB9@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5C990B220200007800221BB9@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Chao Gao <chao.gao@intel.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xen.org, Wei Liu <wei.liu2@citrix.com>, "sergey.dyasli@citrix.com >> Sergey Dyasli" <sergey.dyasli@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjUvMDMvMjAxOSAxNzowOCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjUuMDMuMTkg
YXQgMTI6MTIsIDxzZXJnZXkuZHlhc2xpQGNpdHJpeC5jb20+IHdyb3RlOgo+PiBDdXJyZW50bHkg
Y3B1X3NpZyBzdHJ1Y3QgaXMgbm90IHVwZGF0ZWQgZHVyaW5nIGJvb3Qgd2hlbiBlaXRoZXI6Cj4+
Cj4+ICAgICAxLiB1Y29kZV9zY2FuIGlzIHNldCB0byBmYWxzZSAoZS5nLiBubyAidWNvZGU9c2Nh
biIgaW4gY21kbGluZSkKPj4gICAgIDIuIGluaXRyZCBkb2VzIG5vdCBjb250YWluIGEgbWljcm9j
b2RlIGJsb2IKPiAKPiBXaGF0IGFib3V0ICJ1Y29kZT08bnVtYmVyPiI/CgpZZXMsIGl0J3MgZXF1
YWxseSBhZmZlY3RlZCwgSSdsbCB1cGRhdGUgdGhlIGNvbW1pdCBtZXNzYWdlLgoKPj4gVGhlc2Ug
d2lsbCByZXN1bHQgaW4gY3B1X3NpZy5yZXYgYmVpbmcgMCB3aGljaCBhZmZlY3RzIEFQSUMncwo+
PiBjaGVja19kZWFkbGluZV9lcnJhdGEoKSBhbmQgcmV0cG9saW5lX3NhZmUoKSBmdW5jdGlvbnMu
Cj4+Cj4+IEZpeCB0aGlzIGJ5IGdldHRpbmcgdWNvZGUgcmV2aXNpb24gZWFybHkgZHVyaW5nIGJv
b3QgYW5kIFNNUCBicmluZyB1cC4KPiAKPiBDYW4ndCB5b3UgdGhlbiBkcm9wIHRoZSBjYWxsIGZy
b20gbWljcm9jb2RlX3VwZGF0ZV9jcHUoKT8KCkkgdHJpZWQgdGhpcyBhbmQgZm91bmQgdGhhdCBw
cm9wZXJseSBoYW5kbGluZyBlcnJvcnMgcmVxdWlyZXMKYSBjYWxsIHRvIF9fbWljcm9jb2RlX2Zp
bmlfY3B1KCkuIEJ1dCBpbnN0ZWFkIG9mIGRvaW5nIGFsbCB0aGlzCnJlZmFjdG9yaW5nIG5vdywg
SSdkIHByZWZlciB0aGlzIHBhdGNoIHRvIGdvIG9uIHRvcCBvZiBDaGFvJ3MKc2VyaWVzLCB3aGlj
aCBncmVhdGx5IHNpbXBsaWZpZXMgdGhpbmdzIGluICJyZW1vdmUgc3RydWN0CnVjb2RlX2NwdV9p
bmZvIi4gT3RoZXJ3aXNlLCBtb3N0IG9mIG15IHdvcmsgaGVyZSB3b3VsZCBiZSByZW1vdmVkCmJ5
IHRoZSBuZXh0IHZlcnNpb24gb2YgQ2hhbydzIHNlcmllcy4KCkNoYW8sClRvIGhlbHAgbWUgd2l0
aCB0aGlzIGRlY2lzaW9uLCB3aGVuIGNhbiB3ZSBleHBlY3QgYSB2NyBvZiB5b3VyCnNlcmllcz8K
ClRoYW5rcywKU2VyZ2V5CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
