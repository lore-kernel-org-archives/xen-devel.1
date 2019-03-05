From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 0/2 for-4.12] Introduce runstate area
 registration with phys address
Date: Tue, 5 Mar 2019 14:44:24 +0100
Message-ID: <7e353593-40d8-a607-6c90-970a6f98fbda@suse.com>
References: <1551791671-21703-1-git-send-email-andrii.anisov@gmail.com>
 <5a9a160a-042a-1f80-1c3f-af2660f6cb84@suse.com>
 <f174efb0-0126-8d4c-ded8-515ebc769b73@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <f174efb0-0126-8d4c-ded8-515ebc769b73@gmail.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrii Anisov <andrii.anisov@gmail.com>, xen-devel@lists.xen.org
Cc: Julien Grall <julien.grall@arm.com>, Andrii Anisov <andrii_anisov@epam.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDUvMDMvMjAxOSAxNDozMiwgQW5kcmlpIEFuaXNvdiB3cm90ZToKPiBIZWxsbyBKdWVyZ2Vu
LAo+IAo+IE9uIDA1LjAzLjE5IDE1OjIwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+PiBObyBuZXcg
ZmVhdHVyZXMgZm9yIDQuMTIuIFRoaXMgc2VyaWVzIHdpbGwgaGF2ZSB0byB3YWl0IHVudGlsIDQu
MTMuCj4gCj4gVGhpcyBpcyByYXRoZXIgYSBjb21wbGV4IGZpeCBmb3IgWzFdLgo+IAo+IFsxXQo+
IGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAx
OS0wMS9tc2cwMjM3OS5odG1sCj4gCgpXaXRoIHRoZSBwcm9ibGVtIGV4aXN0aW5nIGZvciBhYm91
dCAxIHllYXIgbm93IEkgc3RpbGwgZG9uJ3Qgc2VlIHRoZQp1cmdlbmN5IHRvIHJ1c2ggaXQgaW50
byA0LjEyICJhdCB0aGUgbGFzdCBtaW51dGUiLgoKQW5kIGFzIHlvdSBhcmUgc2F5aW5nOiB0aGlz
IGlzIGEgcmF0aGVyIGNvbXBsZXggZml4LiBJJ2QgbGlrZSB0byBoYXZlCm9ubHkgb25lIGZ1cnRo
ZXIgUkMgYmVmb3JlIGJyYW5jaGluZyBvZmYgNC4xMiwgc28gSSdkIGxpa2UgdG8gc2VlIHRoaXMK
c2VyaWVzIHRvIGdvIGluIGxhdGVyLgoKSXQgbWlnaHQgc3RpbGwgYmUgY29uc2lkZXJlZCBmb3Ig
NC4xMi4xICh5b3UnZCBoYXZlIHRvIG5lZ290aWF0ZSB0aGF0CndpdGggdGhlIHN0YWJsZSBtYWlu
dGFpbmVyLCBvZiBjb3Vyc2UpLgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
