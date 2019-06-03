From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 2/4] x86: further speed-up to hweight{32,
 64}()
Date: Mon, 03 Jun 2019 01:52:31 -0600
Message-ID: <5CF4D1BF020000780023468C@prv1-mh.provo.novell.com>
References: <5CF0F8530200007800233DE0@prv1-mh.provo.novell.com>
 <5CF0F9770200007800233E04@prv1-mh.provo.novell.com>
 <097ab8e6-8c76-f7c6-d992-09d1b38b3f44@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TYzS=UC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hXhlm-0000xh-C1
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 07:52:38 +0000
In-Reply-To: <097ab8e6-8c76-f7c6-d992-09d1b38b3f44@citrix.com>
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, WeiLiu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDMxLjA1LjE5IGF0IDIxOjIzLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMzEvMDUvMjAxOSAwMjo1MiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IEFjY29yZGlu
ZyB0byBMaW51eCBjb21taXQgMDEzNjYxMWM2MiAoIm9wdGltaXplIGh3ZWlnaHQ2NCBmb3IgeDg2
XzY0IikKPj4gdGhpcyBpcyBhIGZ1cnRoZXIgaW1wcm92ZW1lbnQgb3ZlciB0aGUgdmFyaWFudCB1
c2luZyBvbmx5IGJpdHdpc2UKPj4gb3BlcmF0aW9ucy4gSXQncyBhbHNvIGEgc2xpZ2h0IGZ1cnRo
ZXIgY29kZSBzaXplIHJlZHVjdGlvbi4KPj4KPj4gU3VnZ2VzdGVkLWJ5OiBBbmRyZXcgQ29vcGVy
IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGlj
aCA8amJldWxpY2hAc3VzZS5jb20+Cj4gCj4gVGhpcyBzaG91bGQgYWxzbyBpbmNsdWRlIEFSTTY0
LCB3aGljaCBhbHNvIHVuY29uZGl0aW9uYWxseSBzZWxlY3RzCj4gSEFTX0ZBU1RfTVVMVElQTFkg
aW4gTGludXguCgpJJ3ZlIHZlcnkgaW50ZW50aW9uYWxseSBzcGxpdCB0aGUgQXJtIGNoYW5nZSBm
cm9tIHRoZSB4ODYgb25lOgpMb29raW5nIGF0IHRoZSBnZW5lcmF0ZWQgY29kZSBJJ20gdW5jb252
aW5jZWQgdGhpcyBpcyBhIHdpbgp0aGVyZSwgYW5kIGhlbmNlIEknZCBwcmVmZXIgaWYgc29tZW9u
ZSBjb3VsZCBtZWFzdXJlIHRoaXMuIEl0CmlzIGZvciB0aGlzIHJlYXNvbiB0aGF0IHBhdGNoIDMg
d2FzIGFjdHVhbGx5IHNlbnQgYXMgUkZDLgoKPiBBcyBmb3IgdGhlIHg4NiBzaWRlIG9mIHRoaW5n
cywgQWNrZWQtYnk6IEFuZHJldyBDb29wZXIKPiA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4K
ClRoYW5rcy4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
