From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 7/6] x86/msr: Introduce msr_{set,
 clear}_bits() helpers
Date: Thu, 28 Jun 2018 07:26:28 -0600
Message-ID: <5B34E20402000078001CEDC3@prv1-mh.provo.novell.com>
References: <1530019098-7058-1-git-send-email-andrew.cooper3@citrix.com>
 <1530037364-24758-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1530037364-24758-1-git-send-email-andrew.cooper3@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xen.org>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI2LjA2LjE4IGF0IDIwOjIyLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9tc3IuaAo+ICsrKyBiL3hlbi9pbmNsdWRl
L2FzbS14ODYvbXNyLmgKPiBAQCAtMTEsNiArMTEsMTEgQEAKPiAgI2luY2x1ZGUgPGFzbS9hc21f
ZGVmbnMuaD4KPiAgI2luY2x1ZGUgPGFzbS9jcHVmZWF0dXJlLmg+Cj4gIAo+ICtzdGF0aWMgaW5s
aW5lIHZvaWQgcmRtc3Jfc3BsaXQodW5zaWduZWQgaW50IG1zciwgdWludDMyX3QgKmxvLCB1aW50
MzJfdCAqaGkpCj4gK3sKPiArICAgIGFzbSB2b2xhdGlsZSAoICJyZG1zciIgOiAiPWEiICgqbG8p
LCAiPWQiICgqaGkpIDogImMiIChtc3IpICk7CgpXaGF0J3MgdGhlIHJlYXNvbiBmb3Igbm90IG1h
a2luZyB0aGlzIC4uLgoKPiArfQo+ICsKPiAgI2RlZmluZSByZG1zcihtc3IsdmFsMSx2YWwyKSBc
Cj4gICAgICAgX19hc21fXyBfX3ZvbGF0aWxlX18oInJkbXNyIiBcCj4gIAkJCSAgOiAiPWEiICh2
YWwxKSwgIj1kIiAodmFsMikgXAoKLi4uIHVzZSB0aGlzIGFuZCAuLi4KCj4gQEAgLTIzLDYgKzI4
LDExIEBACj4gICAgICAgICB2YWwgPSBhX18gfCAoKHU2NCliX188PDMyKTsgXAo+ICB9IHdoaWxl
KDApCj4gIAo+ICtzdGF0aWMgaW5saW5lIHZvaWQgd3Jtc3Jfc3BsaXQodW5zaWduZWQgaW50IG1z
ciwgdWludDMyX3QgbG8sIHVpbnQzMl90IGhpKQo+ICt7Cj4gKyAgICBhc20gdm9sYXRpbGUgKCAi
d3Jtc3IiIDo6ICJhIiAobG8pLCAiZCIgKGhpKSwgImMiIChtc3IpICk7CgouLi4gdGhpcyB1c2Ug
Li4uIAoKPiArfQo+ICsKPiAgI2RlZmluZSB3cm1zcihtc3IsdmFsMSx2YWwyKSBcCj4gICAgICAg
X19hc21fXyBfX3ZvbGF0aWxlX18oIndybXNyIiBcCj4gIAkJCSAgOiAvKiBubyBvdXRwdXRzICov
IFwKCi4uLiB0aGlzPyBJbiBmYWN0IGl0J3Mgbm90IHJlYWxseSBjbGVhciB3aHkgd2UgbmVlZCB0
aGUgaW5saW5lIGZ1bmN0aW9ucyBfYW5kXwp0aGUgbWFjcm9zLiBBZmFpY3QgdGhlIHR3byBuZXcg
ZnVuY3Rpb25zIGJlbG93IGNvdWxkIGFsc28gYmUgaW1wbGVtZW50ZWQKd2l0aCBqdXN0IHRoZSBt
YWNyb3MuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
