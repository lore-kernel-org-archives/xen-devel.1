From: George Dunlap <dunlapg@umich.edu>
Subject: Re: [PATCH for-4.12 5/8] pvh/dom0: warn when dom0_mem
 is not set to a fixed value
Date: Thu, 7 Feb 2019 17:09:14 +0000
Message-ID: <CAFLBxZbG2+tuM4Hs11c1U9QebnPyar1EiMWqtV6Wz3VbMRBc4g@mail.gmail.com>
References: <20190130103646.53649-1-roger.pau@citrix.com>
 <20190130103646.53649-6-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8LB1=QO=gmail.com=dunlapg@srs-us1.protection.inumbo.net>)
 id 1grnB0-00060G-Rs
 for xen-devel@lists.xenproject.org; Thu, 07 Feb 2019 17:09:26 +0000
Received: by mail-qt1-x844.google.com with SMTP id 2so691313qtb.5
 for <xen-devel@lists.xenproject.org>; Thu, 07 Feb 2019 09:09:25 -0800 (PST)
In-Reply-To: <20190130103646.53649-6-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBKYW4gMzAsIDIwMTkgYXQgMTA6MzcgQU0gUm9nZXIgUGF1IE1vbm5lIDxyb2dlci5w
YXVAY2l0cml4LmNvbT4gd3JvdGU6Cj4KPiBUaGVyZSBoYXZlIGJlZW4gc2V2ZXJhbCByZXBvcnRz
IG9mIHRoZSBkb20wIGJ1aWxkZXIgcnVubmluZyBvdXQgb2YKPiBtZW1vcnkgd2hlbiBidWlsZGln
biBhIFBWSCBkb20wIHdpdGhvdXQgaGF2aW5nZiBzcGVjaWZpZWQgYSBkb20wX21lbQo+IHZhbHVl
LiBQcmludCBhIHdhcm5pbmcgbWVzc2FnZSBpZiBkb20wX21lbSBpcyBub3Qgc2V0IHRvIGEgZml4
ZWQgdmFsdWUKPiB3aGVuIGJvb3RpbmcgaW4gUFZIIG1vZGUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBS
b2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiAtLS0KPiBDYzogSmFuIEJl
dWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IENjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29v
cGVyM0BjaXRyaXguY29tPgo+IENjOiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgo+IENj
OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4gLS0tCj4gV2l0aG91dCB0aGlzIHBh
dGNoIGNyZWF0aW5nIGEgUFZIIGRvbTAgd2l0aG91dCBhIGRvbTBfbWVtIHBhcmFtZXRlcgo+IGNh
biByZXN1bHQgaW4gdGhlIGRvbTAgYnVpbGRlciBydW5uaW5nIG91dCBvZiBtZW1vcnkgdGh1cyBs
ZWFkaW5nIHRvIGEKPiBYZW4gY3Jhc2guIFRoZSBhZGRlZCBtZXNzYWdlIGdpdmVzIGEgaGl0IHRv
IHRoZSB1c2VyIGFib3V0IGEgcG9zc2libGUKPiBmaXguCgpCdXQgd2h5IHdvdWxkIGl0IHJ1biBv
dXQgb2YgbWVtb3J5PyAgV291bGRuJ3QgaXQgYmUgYmV0dGVyIHRvIGZpbmQgYW5kCmZpeCB0aGUg
cm9vdCBjYXVzZT8KCiAtR2VvcmdlCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
