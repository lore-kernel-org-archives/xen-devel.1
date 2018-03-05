From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/2] x86: report if PCID and INVPCID are
	supported
Date: Mon, 5 Mar 2018 11:48:01 +0000
Message-ID: <d14fa3b9-f235-d103-b435-ca5556b8adc9@citrix.com>
References: <20180305095032.30062-1-wei.liu2@citrix.com>
 <20180305095032.30062-2-wei.liu2@citrix.com>
 <5A9D362002000078001AE74F@prv-mh.provo.novell.com>
 <20180305113144.ufxdqcef5i3aqg62@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=fc0z=f3=citrix.com=prvs=595eaad67=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1esob7-0007hI-5J
 for xen-devel@lists.xenproject.org; Mon, 05 Mar 2018 11:48:05 +0000
In-Reply-To: <20180305113144.ufxdqcef5i3aqg62@citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDUvMDMvMTggMTE6MzEsIFdlaSBMaXUgd3JvdGU6Cj4gT24gTW9uLCBNYXIgMDUsIDIwMTgg
YXQgMDQ6MjA6NDhBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDA1LjAzLjE4
IGF0IDEwOjUwLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4+PiAtLS0gYS94ZW4vYXJj
aC94ODYvc2V0dXAuYwo+Pj4gKysrIGIveGVuL2FyY2gveDg2L3NldHVwLmMKPj4+IEBAIC0xNzAx
LDYgKzE3MDEsMTMgQEAgdm9pZCBfX2luaXQgbm9yZXR1cm4gX19zdGFydF94ZW4odW5zaWduZWQg
bG9uZyBtYmlfcCkKPj4+ICAgICAgICAgICAgIGNwdV9oYXNfbnggPyBYRU5MT0dfSU5GTyA6IFhF
TkxPR19XQVJOSU5HICJXYXJuaW5nOiAiLAo+Pj4gICAgICAgICAgICAgY3B1X2hhc19ueCA/ICIi
IDogIm5vdCAiKTsKPj4+ICAKPj4+ICsKPj4+ICsgICAgcHJpbnRrKFhFTkxPR19JTkZPCj4+PiAr
ICAgICAgICAgICAiUENJRCAoUHJvY2Vzcy1Db250ZXh0IElEZW50aWZpZXIpICVzc3VwcG9ydGVk
XG4iLAo+Pj4gKyAgICAgICAgICAgY3B1X2hhc19wY2lkID8gIiIgOiAibm90ICIpOwo+Pj4gKwo+
Pj4gKyAgICBwcmludGsoWEVOTE9HX0lORk8gIklOVlBDSUQgJXNzdXBwb3J0ZWRcbiIsIGNwdV9o
YXNfaW52cGNpZCA/ICIiIDogIm5vdCAiKTsKPj4gRG8gd2UgcmVhbGx5IG5lZWQgdGhpcz8gV2Ug
bG9nIGEgbWVzc2FnZSBmb3IgTlggYXMgYW4gZXhjZXB0aW9uLAo+PiB3ZSBkb24ndCBkbyBzbyBm
b3Igb3RoZXIgZmVhdHVyZXMgKGFuZCB0aGluZ3Mgd291bGQgZ2V0IHByZXR0eQo+PiB1bndpZWxk
eSBpZiB3ZSBkaWQpLgo+Pgo+IEknbSBub3QgdG9vIGZ1c3MgcmVhbGx5LiBJdCBoZWxwZWQgbWUg
dG8gcGljayBhIG1hY2hpbmUgd2hlbiBJIGRpZG4ndAo+IGhhdmUgdGhlIGV4YWN0IHNwZWMgb2Yg
dGhlIHBvb2wgb2YgbWFjaGluZXMuIFRoZSBzYW1lIGluZm9ybWF0aW9uIGNhbgo+IGNlcnRhaW5s
eSBiZSBvYnRhaW5lZCBmcm9tIGhhcmR3YXJlIGNwdWlkIGluZm8uCj4KPiBPbiBhbm90aGVyIG5v
dGUsIHdoYXQgaXMgdGhlIG1vc3QgcmVsaWFibGUgd2F5IHRvIGV4dHJhY3QgaGFyZHdhcmUgY3B1
aWQKPiBpbmZvIGZyb20gWGVuPyBBSVVJIG5vdyBjcHVpZCBmYXVsdGluZyBjYW4gYmUgZW5hYmxl
ZCBmb3IgYm90aCBQViBhbmQKPiBIVk0gZ3Vlc3RzIHNvIHJ1bm5pbmcgY3B1aWQgaW4gUFYgZ3Vl
c3RzIG1pZ2h0IG5vdCByZXR1cm4gdGhlIHJlYWwgYml0cwo+ICh3aGljaCBpcyBhIGdvb2QgdGhp
bmcpLgoKRm9yIG5vdywgYHhlbi1jcHVpZGAsIHdoaWNoIHVzZXMgU1lTQ1RMX2dldF9jcHVmZWF0
dXJlc2V0IGludGVybmFsbHkuCgpUaGlzIHdpbGwgc2hvcnRseSBiZSBjaGFuZ2luZyB0byBnZXQg
dGhlIGZ1bGx5IGNwdWlkL21zciBwb2xpY2llcyByYXRoZXIKdGhhbiBqdXN0IHRoZSBmZWF0dXJl
IGJpdG1hcHMuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
