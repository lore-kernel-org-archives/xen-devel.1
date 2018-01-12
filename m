From: "Nathan March" <nathan@gt.net>
Subject: Re: Xen Project Spectre/Meltdown FAQ
Date: Fri, 12 Jan 2018 09:17:06 -0800
Message-ID: <05ed01d38bc9$2bcb0890$836119b0$@gt.net>
References: <B3F5B430-F55E-446C-A7C5-7830F2CEDFCD@gmail.com>
 <888C1DAE-2B56-4D59-8529-D9DEA410BB9E@gmail.com>
 <edec8de6-c678-2aa1-5c50-97533c14f8f6@citrix.com>
 <20180107150029.GA2935@mail-itl>
 <alpine.DEB.2.10.1801081804150.4603@sstabellini-ThinkPad-X260>
 <2ff9538c98ece66b66da2484a7b7d67c@randomwebstuff.com>
 <30d1c766-eee6-9af3-3770-05dad888294b@suse.com>
 <4A0D5682-1292-43E9-BBDA-331B3CEF15A4@gmail.com>
 <B50B31AF-0F8E-48B8-A51E-0CD0948631E9@gmail.com>
 <b9015baa7c417c4b6c4742d6340c77a9@randomwebstuff.com>
 <b8c362b9-90e7-cef3-cb54-c89540424ab9@knorrie.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=mogd=eh=gt.net=nathan@srs-us1.protection.inumbo.net>)
 id 1ea2xA-0006B8-Ff
 for xen-devel@lists.xenproject.org; Fri, 12 Jan 2018 17:17:16 +0000
In-Reply-To: <b8c362b9-90e7-cef3-cb54-c89540424ab9@knorrie.org>
Content-Language: en-us
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: 'Hans van Kranenburg' <hans@knorrie.org>, 'Peter' <xen@randomwebstuff.com>, 'Lars Kurth' <lars.kurth.xen@gmail.com>
Cc: 'Juergen Gross' <jgross@suse.com>, 'xen-devel' <xen-devel@lists.xenproject.org>, 'Doug Goldstein' <cardoe@cardoe.com>
List-Id: xen-devel@lists.xenproject.org

PiA+IEluIHRoZSBtYXRyaXggSSBzZWUgIklzIGEgdXNlciBzcGFjZSBhdHRhY2sgb24gdGhlIGd1
ZXN0IGtlcm5lbCBwb3NzaWJsZQo+ID4gKHdoZW4gcnVubmluZyBpbiBhIFhlbiBWTSk/IiBGb3Ig
UFZIIChhbmQgSFZNKSA9IFllc1sxXSB3aGVyZSBbMV0KPiA+IEltcGFjdHMgSW50ZWwgQ1BVcyBv
bmx5Lgo+ID4KPiA+IElzIHRoZXJlIGFueSBtaXRpZ2F0aW9uIGZvciB0aGlzPyAgaS5lLiBIb3cg
dG8gcHJvdGVjdCBhIGd1ZXN0IFZNIGZyb20KPiA+IGl0cyBvd24gdXNlcnNwYWNlIHByb2Nlc3Nl
cy4KPiAKPiBUaGF0IHBhcnQgaXMgaGFuZGxlZCBieSB0aGUga2VybmVsIGluc2lkZSB0aGUgZ3Vl
c3QuIFhlbiBkb2Vzbid0IHNlZQo+IHRoYXQgaGFwcGVuaW5nLgo+IAo+IEl0J3MgZm9yIGV4YW1w
bGUgdGhlIEtQVEkvS0FJU0VSIHBhdGNoZXMgdGhhdCBnb3QgaW50byB0aGUgbGludXgga2VybmVs
cwo+IG5vdy4KClRoZSBtb3N0IHJlY2VudCB1cGRhdGUgdG8gWFNBLTI1NCBzZWVtcyB0byBjbGVh
cmx5IHN0YXRlIHRoYXQgdGhlIGtlcm5lbCBLUFRJIHBhdGNoZXMgd2lsbCBub3QgcHJvdGVjdCB0
aGUgZ3Vlc3QgZnJvbSBpdHNlbGYgd2l0aCB0aGUgc2hpbSBpbnN0YWxsZWQ6Cgo+IFBWLWluLVBW
SC9IVk0gc2hpbSBhcHByb2FjaCBsZWF2ZXMgKmd1ZXN0KiB2dWxuZXJhYmxlIHRvIE1lbHRkb3du
Cj4gYXR0YWNrcyBmcm9tIGl0cyB1bnByaXZpbGVnZWQgdXNlcnMsIGV2ZW4gaWYgdGhlIGd1ZXN0
IGhhcyBLUFRJCj4gcGF0Y2hlcy4gIFRoYXQgaXMsIGd1ZXN0IHVzZXJzcGFjZSBjYW4gdXNlIE1l
bHRkb3duIHRvIHJlYWQgYWxsIG1lbW9yeQo+IGluIHRoZSBzYW1lIGd1ZXN0LgoKU28gdGhlIHF1
ZXN0aW9ucyByZW1haW5zLCBob3cgZG8geW91IHByb3RlY3QgYSBndWVzdCBmcm9tIGEgbWFsaWNp
b3VzIHVzZXIgaW5zaWRlIG9mIGl0PwoKSXMgaXQgcmVhbGx5IHRoZSBjYXNlIHRoYXQgdGhlICpv
bmx5KiBmdWxsIHNvbHV0aW9uIHRvIG1vdmUgdG8geGVuIDQuMTAgYW5kIGd1ZXN0IGtlcm5lbCA0
LjExPyEKCkNoZWVycywKTmF0aGFuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
