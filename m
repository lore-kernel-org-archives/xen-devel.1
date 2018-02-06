From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH] x86: reduce Meltdown band-aid IPI overhead
Date: Tue, 6 Feb 2018 17:33:23 +0000
Message-ID: <62045fce-a08f-4024-b0ee-3af979b6a954@citrix.com>
References: <5A6B280602000078001A2BC9@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=q0qo=fa=citrix.com=prvs=568a97e32=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1ej77b-0007Lo-0Z
 for xen-devel@lists.xenproject.org; Tue, 06 Feb 2018 17:33:31 +0000
In-Reply-To: <5A6B280602000078001A2BC9@prv-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDEvMjYvMjAxOCAxMjowNyBQTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gSW4gY2FzZSB3ZSBj
YW4gZGV0ZWN0IHNpbmdsZS10aHJlYWRlZCBndWVzdCBwcm9jZXNzZXMgKGJ5IGNoZWNraW5nCj4g
d2hldGhlciB3ZSBjYW4gYWNjb3VudCBmb3IgYWxsIHJvb3QgcGFnZSB0YWJsZSB1c2VzIGxvY2Fs
bHkgb24gdGhlIHZDUFUKPiB0aGF0J3MgcnVubmluZyksIHRoZXJlJ3Mgbm8gcG9pbnQgaW4gaXNz
dWluZyBhIHN5bmMgSVBJIHVwb24gYW4gTDQgZW50cnkKPiB1cGRhdGUsIGFzIG5vIG90aGVyIHZD
UFUgb2YgdGhlIGd1ZXN0IHdpbGwgaGF2ZSB0aGF0IHBhZ2UgdGFibGUgbG9hZGVkLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCkxvb2tzIGdvb2Qg
dG8gbWUsIGFuZCBJIHRoaW5rIHRoZSBzdW1tYXRpb24gaXMgcHJldHR5IGNsZWFyOgoKQWNrZWQt
Ynk6IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
