From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: Resume from suspend to RAM broken when using early
 microcode updates
Date: Wed, 11 Apr 2018 12:51:26 +0100
Message-ID: <6fbc10ea-d222-94e0-0a60-76cbc6ba1ab2@citrix.com>
References: <c91218e2-d793-4e1d-343f-c4a566e66b47@invisiblethingslab.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=rlyf=ha=citrix.com=prvs=6327ebc18=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1f6EHj-0005g5-VR
 for xen-devel@lists.xenproject.org; Wed, 11 Apr 2018 11:51:31 +0000
In-Reply-To: <c91218e2-d793-4e1d-343f-c4a566e66b47@invisiblethingslab.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Simon Gaiser <simon@invisiblethingslab.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTEvMDQvMTggMTI6NDgsIFNpbW9uIEdhaXNlciB3cm90ZToKPiBIaSwKPgo+IHdoZW4gSSB1
c2UgZWFybHkgbWljcm9jb2RlIGxvYWRpbmcgd2l0aCB0aGUgbWljcm9jb2RlIHVwZGF0ZSB3aXRo
IHRoZQo+IEJUSSBtaXRpZ2F0aW9ucywgcmVzdW1pbmcgZnJvbSBzdXNwZW5kIHRvIFJBTSBpcyBi
cm9rZW4uCj4KPiBCYXNlZCBvbiBhZGRlZCBsb2dnaW5nIHRvIGVudGVyX3N0YXRlKCkgKGZyb20g
cG93ZXIuYykgaXQgZG9lc24ndAo+IHN1cnZpdmUgdGhlIGxvY2FsX2lycV9yZXN0b3JlKGZsYWdz
KSBjYWxsIChhdCBsZWFzdCBhIHByaW50aygpIGFmdGVyIHRoZQo+IGNhbGwgZG9lc24ndCBvdXRw
dXQgYW55dGhpbmcgb24gdGhlIHNlcmlhbCBjb25zb2xlKS4KPgo+IEkgZ3Vlc3MgdGhhdCBzb21l
IGlycSBoYW5kbGVyIHRyaWVzIHRvIHVzZSBJQlJTL0lCUEIuIEJ1dCB0aGUgbWljcm9jb2RlCj4g
aXMgb25seSBsb2FkZWQgbGF0ZXIuCj4KPiBJZiBJIHNpbXBseSBtb3ZlIHRoZSBtaWNyb2NvZGVf
cmVzdW1lX2NwdSgwKSBkaXJlY3RseSBiZWZvcmUgdGhlCj4gbG9jYWxfaXJxX3Jlc3RvcmUoZmxh
Z3MpIGV2ZXJ5dGhpbmcgc2VlbXMgdG8gd29yayBmaW5lLiBCdXQgSSdtIG5vdCBzdXJlCj4gaWYg
dGhpcyBoYXMgdW5pbnRlbmRlZCBjb25zZXF1ZW5jZXMuCj4KPiBJIHRlc3RlZCB0aGUgYWJvdmUg
d2l0aCBYZW4gNC44LjMgZnJvbSBRdWJlcyB3aGljaCBpbmNsdWRlcyB0aGUgQlRJIGFuZAo+IG1p
Y3JvY29kZSBwYXRjaGVzIGZyb20gc3RhZ2luZy00LjguIEFGQUlDUyB0aGVyZSBhcmUgbm8gY29t
bWl0cyB3aGljaAo+IGNoYW5nZXMgdGhlIGFmZmVjdGVkIGNvZGUgb3Igb3RoZXIgY29tbWl0cyB3
aGljaCBzb3VuZCByZWxldmFudCBzbyB0aGlzCj4gcHJvYmFibHkgYWZmZWN0ZWQgYWxzbyBhbGwg
dGhlIG5ld2VyIGJyYW5jaGVzLgoKUzMgc3VwcG9ydCBpcyBhIHZlcnkgdW5sb3ZlZCBhcmVhIG9m
IHRoZSBoeXBlcnZpc29yLgoKWWVzIC0gd2UgZGVmaW5pdGVseSBuZWVkIHRvIGdldCBtaWNyb2Nv
ZGUgcmVsb2FkZWQgYmVmb3JlIGludGVycnVwdHMgYXJlCmVuYWJsZWQuwqAgVGhhdCBzYWlkLCBJ
IHdvdWxkIGhhdmUgZXhwZWN0ZWQgYSBiYWNrdHJhY2UgY29tcGxhaW5pbmcgYWJvdXQKYSBHUCBm
YXVsdCBpZiB3ZSBoYWQgaGl0IHRoZSB1c2Ugb2YgSUJSUy9JQlBCIGJlZm9yZSB0aGUgbWljcm9j
b2RlIHdhcwpyZWxvYWRlZC4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
