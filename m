From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86emul/fuzz: adjust canonicalization in
 sanitize_input()
Date: Mon, 01 Apr 2019 01:09:52 -0600
Message-ID: <5CA1B9400200007800223649@prv1-mh.provo.novell.com>
References: <5C9E30F40200007800222DDC@prv1-mh.provo.novell.com>
 <8B8E72C2-696B-4C0D-8733-78C7B93B9FB0@citrix.com>
 <5C9E38620200007800222F8B@prv1-mh.provo.novell.com>
 <F2552738-0569-4DC0-A93D-F0D3191C5D5E@citrix.com>
 <5C9E447B0200007800223018@prv1-mh.provo.novell.com>
 <DC8F0A76-5080-40AB-BB46-03298755E295@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=uvFD=SD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hAr4y-0002cW-4J
 for xen-devel@lists.xenproject.org; Mon, 01 Apr 2019 07:10:00 +0000
In-Reply-To: <DC8F0A76-5080-40AB-BB46-03298755E295@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: george.dunlap@citrix.com
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI5LjAzLjE5IGF0IDIwOjIwLCA8R2VvcmdlLkR1bmxhcEBjaXRyaXguY29tPiB3cm90
ZToKPiBIb3dldmVyLCB0aGUgd2hvbGUgcG9pbnQgb2YgdGVzdGluZyBpcyB0byBmaW5kIHBsYWNl
cyB3aGVyZSB5b3VyIGFzc3VtcHRpb25zIAo+IGFyZSB2aW9sYXRlZC4gIElmIHRoZSBlbXVsYXRv
ciBldmVyICpkaWQqIGJlaGF2ZSBkaWZmZXJlbnRseSBmb3IgY2Fub25pY2FsIAo+IGFuZCBub24t
Y2Fub25pY2FsIGFkZHJlc3Nlcywgb3IgbmVhciB0aGUgYm91bmRhcnkgb2YgY2Fub25pY2l0eSwg
d2XigJlkIHdhbnQgCj4gdGhvc2UgYmVoYXZpb3JzIHRvIGJlIHRlc3RlZC4KCkluIHRoaXMgY2Fz
ZSB3b3VsZG4ndCBpdCBiZSBwcmVmZXJhYmxlIHRvIG5vdCBleGFjdGx5IGNhbm9uaWNhbGl6ZQpy
ZWdpc3RlcnMsIGJ1dCBvbmx5IGFsbW9zdCwgdG8gZ2V0IHRoZW0gbmVhciB0aGUgYm91bmRhcnks
IGJ1dApib3RoIGFib3ZlIGFuZCBiZWxvdz8KCkFsc28gcGxlYXNlIGxldCdzIG5vdCBmb3JnZXQg
dGhhdCB0aGVyZSBhcmUgc2V2ZXJhbCBjb25zdGl0dWVudApwYXJ0cyB0byBhIGxpbmVhciBhZGRy
ZXNzIGNhbGN1bGF0aW9uOiBCYXNlIGFkZHJlc3MgKGFueSBHUFIgb3IKbm9uZSBhdCBhbGwpLCBz
Y2FsZWQgaW5kZXggKEdQUnMgb3RoZXIgdGhhbiAlcnNwIG9yIG5vbmUgYXQgYWxsLAp3aXRoIEFW
WCBhbmQgbGF0ZXIgYWxzbyBbWFlaXU1NIHJlZ2lzdGVycyksIGRpc3BsYWNlbWVudAoocG9zc2li
bHkgemVybyksIGFuZCBzZWdtZW50IHJlZ2lzdGVyIGJhc2UgKHR5cGljYWxseSBidXQgbm90CmFs
d2F5cyB6ZXJvKS4gV2hhdCBtYXR0ZXJzIChvdXRzaWRlIG9mIHRoZSBzcGVjaWFsIGNhc2VzIHRo
YXQKQW5kcmV3IGRpZCBlbnVtZXJhdGUsIHdoZXJlIHRoZSBlbXVsYXRvciBjdXJyZW50bHkgZG9l
cwpjYW5vbmljYWwgY2hlY2tzIG9uIGl0cyBvd24pIGlzIHRoZSByZXN1bHQgb2YgdGhlIGNhbGN1
bGF0aW9uLCBub3QKdGhlIHZhbHVlKHMpIG9mIGlucHV0IHJlZ2lzdGVycy4gT2YgY291cnNlLCBp
ZiBhbnkgb2YgdGhlIHBhcnRzCmlzIG5vbi1jYW5vbmljYWwsIHRoZXJlJ3MgYSBnb29kIGNoYW5j
ZSB0aGF0IHRoZSBjYWxjdWxhdGlvbgpyZXN1bHQgdG9vIHdpbGwgYmUuCgpKYW4KCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
