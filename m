From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH] mm: option to _always_ scrub freed domheap
 pages
Date: Tue, 7 May 2019 12:21:38 +0100
Message-ID: <90f81b7f-ceef-e2ab-62d0-5c60a7af609e@citrix.com>
References: <20190506124624.54454-1-elnikety@amazon.com>
 <32d91d7a-a02d-65e3-d166-deb3b64ab592@citrix.com>
 <5CD1580E020000780022C6D8@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=eprW=TH=citrix.com=prvs=0232d1aa4=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1hNyAy-000226-Rl
 for xen-devel@lists.xenproject.org; Tue, 07 May 2019 11:22:24 +0000
In-Reply-To: <5CD1580E020000780022C6D8@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Eslam Elnikety <elnikety@amazon.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gNS83LzE5IDExOjAzIEFNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAwNy4wNS4xOSBh
dCAxMTo1NSwgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT4gd3JvdGU6Cj4+IE9uIDUvNi8xOSAx
OjQ2IFBNLCBFc2xhbSBFbG5pa2V0eSB3cm90ZToKPj4gWy4uLl0KPj4gSSdtIHdvbmRlcmluZyBp
ZiB0aGlzIHNob3VsZCBkZWZhdWx0IHRvICd0cnVlJywgYW5kIHBlb3BsZSB3aG8gcmVhbGx5Cj4+
IHdhbnQgdGhlIGV4dHJhIHBlcmZvcm1hbmNlIHNob3VsZCB0dXJuIGl0IG9mZi4KPiAKPiBXaHkg
d291bGQgd2Ugd2FudCB0byBjYXRlciBmb3IgYnVnZ3kgZ3Vlc3RzIGJ5IGRlZmF1bHQ/CgpCZWNh
dXNlIG9uZSBvZiB0aGUgYmlnIHNlbGxpbmcgcG9pbnRzIGZvciBYZW4gaXMgdGhhdCBpdCBpcyBt
b3JlIHNlY3VyZTsKYW5kIG9uZSBvZiB0aGUgcG9pbnRzIG9mIHZpcnR1YWxpemF0aW9uIGlzIHRv
IHJ1biBndWVzdHMgZm9yIHdoaWNoIHlvdQpoYXZlIG5vIG9wdGlvbiBvZiBjaGFuZ2luZyBvciB1
cGdyYWRpbmcuICBIYXZpbmcgYW4gZXh0cmEgc2FmZXR5IGNhdGNoCnRvIHByZXZlbnQgbG9zcyBv
ZiBkYXRhICpldmVuIGluIHRoZSBjYXNlIG9mIGJ1Z2d5IGd1ZXN0cyogb24gYnkgZGVmYXVsdApp
cyBvbi1icmFuZCBmb3IgdXMuCgpUaGF0IHNhaWQsIHRoZSBzdWdnZXN0aW9uIHdhcyBwcmVkaWNh
dGVkIG9uIG15IHJhdGhlciB2YWd1ZSBpbXByZXNzaW9uCnRoYXQgWGVuU2VydmVyIGhhcyBiZWVu
IGRvaW5nIHRoaXMgYnkgZGVmYXVsdCBmb3IgeWVhcnMgbm93LCBhbmQgdGh1cwpoYXMgYmVlbiBw
cm92ZW4gdG8gbm90IGJlIHRlcnJpYmx5IHByb2JsZW1hdGljIHBlcmZvcm1hbmNlLXdpc2UuICBJ
Zgp0aGF0J3Mgbm90IHRoZSBjYXNlLCB0aGVuIG9mZi1ieS1kZWZhdWx0IG1pZ2h0IGJlIGEgYmV0
dGVyIG9wdGlvbi4KCiAtR2VvcmdlCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
