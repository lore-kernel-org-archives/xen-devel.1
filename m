From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v4 01/15] x86/cpu: Create Hygon Dhyana
 architecture support file
Date: Tue, 2 Apr 2019 13:13:08 +0100
Message-ID: <4c59b3c9-cf52-275f-85c2-30a98fbeb275@citrix.com>
References: <cover.1553935727.git.puwen@hygon.cn>
 <eb635da990e92443a91b2ae598ed354e35975efa.1553935727.git.puwen@hygon.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=QSF0=SE=citrix.com=prvs=9886cf734=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hBIKq-0002uc-Jf
 for xen-devel@lists.xenproject.org; Tue, 02 Apr 2019 12:16:12 +0000
In-Reply-To: <eb635da990e92443a91b2ae598ed354e35975efa.1553935727.git.puwen@hygon.cn>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Pu Wen <puwen@hygon.cn>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMzAvMDMvMjAxOSAxMDo0MiwgUHUgV2VuIHdyb3RlOgo+ICtzdGF0aWMgY29uc3Qgc3RydWN0
IGNwdV9kZXYgaHlnb25fY3B1X2RldiA9IHsKPiArCS5jX3ZlbmRvcgk9ICJIeWdvbiIsCj4gKwku
Y19pZGVudCAJPSB7ICJIeWdvbkdlbnVpbmUiIH0sCj4gKwkuY19lYXJseV9pbml0CT0gZWFybHlf
aW5pdF9hbWQsCj4gKwkuY19pbml0CQk9IGluaXRfaHlnb24sCj4gK307Cj4gKwo+ICtpbnQgX19p
bml0IGh5Z29uX2luaXRfY3B1KHZvaWQpCj4gK3sKPiArCWNwdV9kZXZzW1g4Nl9WRU5ET1JfSFlH
T05dID0gJmh5Z29uX2NwdV9kZXY7Cj4gKwlyZXR1cm4gMDsKPiArfQo+IGRpZmYgLS1naXQgYS94
ZW4vaW5jbHVkZS9hc20teDg2L3g4Ni12ZW5kb3JzLmggYi94ZW4vaW5jbHVkZS9hc20teDg2L3g4
Ni12ZW5kb3JzLmgKPiBpbmRleCAzOGE4MWMzLi5mYTFjYmI0IDEwMDY0NAo+IC0tLSBhL3hlbi9p
bmNsdWRlL2FzbS14ODYveDg2LXZlbmRvcnMuaAo+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYv
eDg2LXZlbmRvcnMuaAo+IEBAIC05LDYgKzksNyBAQAo+ICAjZGVmaW5lIFg4Nl9WRU5ET1JfQU1E
IDIKPiAgI2RlZmluZSBYODZfVkVORE9SX0NFTlRBVVIgMwo+ICAjZGVmaW5lIFg4Nl9WRU5ET1Jf
U0hBTkdIQUkgNAo+IC0jZGVmaW5lIFg4Nl9WRU5ET1JfTlVNIDUKPiArI2RlZmluZSBYODZfVkVO
RE9SX0hZR09OIDUKPiArI2RlZmluZSBYODZfVkVORE9SX05VTSA2CgpUaGlzIGNoYW5nZSB3aWxs
IG5lZWQgcmViYXNpbmcgb3ZlcgpodHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD14ZW4u
Z2l0O2E9Y29tbWl0ZGlmZjtoPWU3MjMwOWZmYmU3YzRlNTA3NjQ5Yzc0NzQ5ZjEzMGNkYTY5MTEz
MWMKLCB3aGljaCBoYXMgZHJvcHBlZCB0aGUgLmNfaWRlbnQgZmllbGQgZm9yIGEgbW9yZSBlZmZp
Y2llbnQgbG9va3VwCm1lY2hhbmlzbS4KCkhvcGVmdWxseSB0aGUgYWRqdXN0bWVudHMgYXJlIGFs
bCBvYnZpb3VzLsKgIElmIG5vdCwgSSBjYW4gZHJhZnQgYSBwYXRjaC4KCn5BbmRyZXcKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
