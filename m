From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 3/3] x86/mm-locks: apply a bias to lock
 levels for current domain
Date: Wed, 19 Dec 2018 07:32:41 -0700
Message-ID: <5C1A5689020000780020787C@prv1-mh.provo.novell.com>
References: <20181218160542.56173-1-roger.pau@citrix.com>
 <20181218160542.56173-4-roger.pau@citrix.com>
 <6475a09e-07c8-cb0e-36eb-d7c024b5239f@citrix.com>
 <20181219121027.foezgrkovz7yddl2@mac>
 <2704c247-c835-6ec7-c15e-0ee24642c887@citrix.com>
 <59df7f1b-39d5-f2df-c67d-65c9c7e23339@citrix.com>
 <15d740c2-e325-0385-07fb-478e6f1f4e63@citrix.com>
 <f49bf450-cc65-2a8e-dcfd-8eaf6ab61ac0@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=aYfl=O4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gZctz-0001Lh-Ny
 for xen-devel@lists.xenproject.org; Wed, 19 Dec 2018 14:32:47 +0000
In-Reply-To: <f49bf450-cc65-2a8e-dcfd-8eaf6ab61ac0@citrix.com>
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
Cc: Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, george.dunlap@citrix.com, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE5LjEyLjE4IGF0IDE1OjA3LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTkvMTIvMjAxOCAxMzo1NSwgR2VvcmdlIER1bmxhcCB3cm90ZToKPj4gWWVzLCBp
ZiBzb21lb25lIHVzZXMgWFNNIHRvIGJ5cGFzcyB0aGUgSVNfUFJJVigpIGZ1bmN0aW9uYWxpdHkg
dG8gZ2l2ZQo+PiBvbmUgZG9tYWluIGFjY2VzcyBvdmVyIGFub3RoZXIsIHRoZW4gdGhlIGxvY2sg
Y2hlY2tpbmcgd2lsbCB0cmlnZ2VyLgo+IAo+IE5vb25lIHNob3VsZCBiZSBhYmxlIHRvIHRyaWdn
ZXIgYXNzZXJ0aW9ucyBpbiB0aGUgaHlwZXJ2aXNvciBieSBzaW1wbHkKPiBlZGl0aW5nIHRoZSBY
U00gcG9saWN5Lgo+IAo+IFRoaXMgcXVpdGUgY2xlYXJseSBkZW1vbnN0cmF0ZXMgdGhhdCB0aGUg
cHJvcG9zZWQgbG9naWMgaXNuJ3QgYXBwcm9wcmlhdGUuCgpZb3UgY291bGQgdmlldyBpdCB0aGUg
b3RoZXIgd2F5IGFyb3VuZDogQW55b25lIHdobyB3cml0ZXMgYW4KWFNNIHBvbGljeSB2aW9sYXRp
bmcgYXNzdW1wdGlvbnMgaW4gdGhlIGh5cGVydmlzb3IgaXMgc2hvb3RpbmcKdGhlbXNlbHZlcyBp
biB0aGUgZm9vdCAocmVhZDogaW50cm9kdWNlcyBhIGJ1ZykuIEluIHBhcnRpY3VsYXIgSQpkb24n
dCB0aGluayBzb21ldGhpbmcgbGlrZSBmdXp6ZWQgWFNNIHBvbGljaWVzIHdvdWxkIG1ha2UgYW55
CnNlbnNlICh3aGljaCBpcyBubyBkaWZmZXJlbnQgdG8gc29tZW9uZSBtYWtpbmcgcmFuZG9tIGVk
aXRzKS4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
