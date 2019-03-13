From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v6 11/12] x86/microcode: Synchronize late
 microcode loading
Date: Wed, 13 Mar 2019 01:54:46 -0600
Message-ID: <5C88B746020000780021DF4D@prv1-mh.provo.novell.com>
References: <1552291056-20286-1-git-send-email-chao.gao@intel.com>
 <1552291056-20286-12-git-send-email-chao.gao@intel.com>
 <20190313000751.GF11608@araj-mobl1.jf.intel.com>
 <20190313050241.GA24657@gao-cwp>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=GbKp=RQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h3yiz-0006dJ-CN
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2019 07:54:53 +0000
In-Reply-To: <20190313050241.GA24657@gao-cwp>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ashok Raj <ashok.raj@intel.com>, Chao Gao <chao.gao@intel.com>
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel <xen-devel@lists.xenproject.org>, tglx@linutronix.de, Borislav Petkov <bp@suse.de>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEzLjAzLjE5IGF0IDA2OjAyLCA8Y2hhby5nYW9AaW50ZWwuY29tPiB3cm90ZToKPiBP
biBUdWUsIE1hciAxMiwgMjAxOSBhdCAwNTowNzo1MVBNIC0wNzAwLCBSYWosIEFzaG9rIHdyb3Rl
Ogo+Pk9uIE1vbiwgTWFyIDExLCAyMDE5IGF0IDAzOjU3OjM1UE0gKzA4MDAsIENoYW8gR2FvIHdy
b3RlOgo+Pj4gKyAgICBpZiAoIGNwdSA9PSBjcHVtYXNrX2ZpcnN0KHBlcl9jcHUoY3B1X3NpYmxp
bmdfbWFzaywgY3B1KSkgKQo+Pj4gKyAgICAgICAgcmV0ID0gbWljcm9jb2RlX3VwZGF0ZV9jcHUo
KTsKPj4KPj5Eb2VzIHJldCBoYXZlIGFueSB1c2VmdWwgdGhpbmdzIG9uIGlmIHRoZSB1cGRhdGUg
ZmFpbGVkPyBEb2Vzbid0IHNlZW0gCj4+dG8gYmUgdXNlZCBiZWZvcmUgeW91IG92ZXJ3cml0ZSBs
YXRlciBpbiBjb2xsZWN0X2NwdV9pbmZvKCk/Cj4gCj4gSXQgaGFzIHRoZSByZWFzb24gb2YgZmFp
bHVyZSBvbiBlcnJvci4gQWN0YWxseSwgdGhlcmUgYXJlIHR3byByZWFzb25zOgo+IG9uZSBpcyBu
byBwYXRjaCBvZiBuZXdlciByZXZpc2lvbiwgdGhlIG90aGVyIGlzIHdlIHRyaWVkIHRvIHVwZGF0
ZSBidXQKPiB0aGUgbWljcm9jb2RlIHJldmlzaW9uIGRpZG4ndCBjaGFuZ2UuIEkgY2FuIGNoZWNr
IHRoaXMgcmV0dXJuIHZhbHVlIGFuZAo+IHByaW50IG1vcmUgaW5mb3JtYXRpdmUgbWVzc2FnZSB0
byBhZG1pbi4gQW5kIGZ1cnRoZXJtb3JlLCBmb3IgdGhlCj4gbGF0dGVyLCB3ZSBjYW4gcmVtb3Zl
IHRoZSB1Y29kZSBwYXRjaCBmcm9tIGNhY2hlcyB0byBhZGRyZXNzIFJvZ2VyJ3MKPiBjb25jZXJu
IGV4cHJlc3NlZCBpbiBjb21tZW50cyB0byBwYXRjaCA0ICYgNS4KCkJ0dywgSSdtIG5vdCBzdXJl
IHJlbW92aW5nIHN1Y2ggdWNvZGUgZnJvbSB0aGUgY2FjaGUgaXMgYXBwcm9wcmlhdGU6Ckl0IG1h
eSB3ZWxsIGFwcGx5IGVsc2V3aGVyZSwgdW5sZXNzIHRoZXJlJ3MgYSBjbGVhciBpbmRpY2F0aW9u
IHRoYXQgdGhlCmJsb2IgaXMgYnJva2VuLiBTbyBwZXJoYXBzIHRoZXJlIG5lZWRzIHRvIGJlIHNw
ZWNpYWwgY2FzaW5nIG9mIC1FSU8sCndoaWNoIGdldHMgcmV0dXJuZWQgd2hlbiB0aGUgdWNvZGUg
cmV2IHJlcG9ydGVkIGJ5IHRoZSBDUFUgYWZ0ZXIKdGhlIHVwZGF0ZSBkb2VzIG5vdCBtYXRjaCBl
eHBlY3RhdGlvbnMuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
