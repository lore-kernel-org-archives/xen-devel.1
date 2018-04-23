From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH-for-4.11 v2] xpti: fix bug in double fault
 handling
Date: Mon, 23 Apr 2018 15:40:54 +0200
Message-ID: <d6907047-19d3-401a-239a-aa95236023c7@suse.com>
References: <20180423123806.12650-1-jgross@suse.com>
 <134e8c26-d270-d14b-0d8c-27c19a2ac6c4@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=hhva=hm=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fAbiH-0001WD-11
 for xen-devel@lists.xenproject.org; Mon, 23 Apr 2018 13:41:01 +0000
In-Reply-To: <134e8c26-d270-d14b-0d8c-27c19a2ac6c4@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com
List-Id: xen-devel@lists.xenproject.org

T24gMjMvMDQvMTggMTU6MDYsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gT24gMjMvMDQvMTggMTM6
MzgsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IFdoZW4gZW50ZXJpbmcgdGhlIGh5cGVydmlzb3Ig
dmlhIHRoZSBkb3VibGUgZmF1bHQgaGFuZGxlciByZXNldHRpbmcKPj4geGVuX2NyMyB3YXMgbWlz
c2luZy4gVGhpcyBsZWQgdG8gc3dpdGNoaW5nIHRvIHB2X2NyMyB3aGVuIHJldHVybmluZwo+PiBm
cm9tIHRoZSBuZXh0IGZvbGxvd2luZyBpbnRlcnJ1cHQuIFNvIHJlcGFpciB0aGlzIGluIG9yZGVy
IHRvIGFsbG93Cj4+IGludGVycnVwdCBoYW5kbGluZyB0byB3b3JrIGV2ZW4gYWZ0ZXIgYSBkb3Vi
bGUgZmF1bHQuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNl
LmNvbT4KPj4gLS0tCj4+ICB4ZW4vYXJjaC94ODYveDg2XzY0L2VudHJ5LlMgfCAxICsKPj4gIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gv
eDg2L3g4Nl82NC9lbnRyeS5TIGIveGVuL2FyY2gveDg2L3g4Nl82NC9lbnRyeS5TCj4+IGluZGV4
IDQ1ZDk4NDJkMDkuLjI1NDI3YjBjZWMgMTAwNjQ0Cj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni94ODZf
NjQvZW50cnkuUwo+PiArKysgYi94ZW4vYXJjaC94ODYveDg2XzY0L2VudHJ5LlMKPj4gQEAgLTc3
Myw2ICs3NzMsNyBAQCBFTlRSWShkb3VibGVfZmF1bHQpCj4+ICAgICAgICAgIG5lZyAgICVyYngK
Pj4gIC5MZGJsZl9jcjNfbG9hZDoKPj4gICAgICAgICAgbW92ICAgJXJieCwgJWNyMwo+PiArICAg
ICAgICBtb3ZxICQwLCBTVEFDS19DUFVJTkZPX0ZJRUxEKHhlbl9jcjMpKCVyMTQpCj4+ICAuTGRi
bGZfY3IzX29rYXk6Cj4+ICAKPj4gICAgICAgICAgbW92cSAgJXJzcCwlcmRpCj4gCj4gV2hhdCBh
Ym91dCB0aGUgb3RoZXIgd3JpdGUgaW50byB4ZW5fY3IzIHdpdGggYSBuZWdhdGVkIHZhbHVlP8Kg
IFdvbid0Cj4gdGhpcyBzdGlsbCBleHBsb2RlIGlmIHdlIGdldCBhbiBOTUkgb3IgTUNFIGF0IHRo
ZSB3cm9uZyBtb21lbnQ/CgpIbW0sIHlvdSBtZWFuIGEgTk1JIGJldHdlZW4gdGhlIG1vdiB0byAl
Y3IzIGFuZCB6ZXJvaW5nIHhlbl9jcjM/CkNvdWxkIGJlIGFuIGlzc3VlLCB5ZXMuIE9rYXksIFYz
IHRoZW4uLi4KCgpKdWVyZ2VuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
