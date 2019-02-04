From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH for-4.12 1/8] dom0/pvh: align allocation and
 mapping order to start address
Date: Mon, 04 Feb 2019 09:41:34 -0700
Message-ID: <5C586B3E0200007800213BCA@prv1-mh.provo.novell.com>
References: <20190130103646.53649-1-roger.pau@citrix.com>
 <20190130103646.53649-2-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=mG44=QL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gqhJT-0003sW-SO
 for xen-devel@lists.xenproject.org; Mon, 04 Feb 2019 16:41:39 +0000
In-Reply-To: <20190130103646.53649-2-roger.pau@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDMwLjAxLjE5IGF0IDExOjM2LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IER1ZSB0byB0aGUgcmVjZW50IGNoYW5nZXMgaW4gdGhlIGlvbW11IG1hcHBpbmcgbG9naWMsIHRo
ZSBzdGFydAo+IGFkZHJlc3NlcyBwcm92aWRlZCBuZWVkIHRvIGJlIGFsaWduZWQgdG8gdGhlIG9y
ZGVyIGludGVuZGVkIHRvIGJlCj4gbWFwcGVkLgoKSXJyZXNwZWN0aXZlIG9mIHlvdXIgcmVwbHkg
dG8gV2VpJ3Mgc2ltaWxhciByZXF1ZXN0ICh3aGVyZSB5b3UndmUKcHJvdmlkZWQgbGlua3MgdG8g
bWFpbHMgc2hvd2luZyBjcmFzaGVzKSBJJ2QgbGlrZSB5b3UgdG8gZXhwbGFpbgp0aGlzIGJldHRl
ci4gVGhpcyBpcyBpbiBwYXJ0aWN1bGFyIGJlY2F1c2UgSSBkb24ndCByZWFsbHkgc2VlIHdoYXQK
InJlY2VudCBjaGFuZ2VzIGluIHRoZSBpb21tdSBtYXBwaW5nIGxvZ2ljIiB5b3UgdGFsayBhYm91
dC4gVGhlCmNvZGUgY2hhbmdlIGl0c2VsZiBsb29rcyBva2F5LCBkZXNwaXRlIG1lIG5vdCBiZWlu
ZyBvdmVybHkgaGFwcHkKd2l0aCB0aGUgdXNlIG9mIG1pbigpIGhlcmUsIHdoaWNoIGlpcmMgd2Fz
IGFscmVhZHkgY29tbWVudGVkCmFib3V0LgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
