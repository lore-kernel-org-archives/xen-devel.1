From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] xen/vm_event: fix rc check for
 uninitialized ring
Date: Fri, 24 May 2019 16:57:32 +0200
Message-ID: <329d0307-de78-a1f1-bab9-d76c7aa57014@suse.com>
References: <20190524131522.29170-1-jgross@suse.com>
 <5CE7FB8E0200007800232113@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=vjOl=TY=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hUBda-0006bb-A8
 for xen-devel@lists.xenproject.org; Fri, 24 May 2019 14:57:38 +0000
In-Reply-To: <5CE7FB8E0200007800232113@prv1-mh.provo.novell.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjQvMDUvMjAxOSAxNjoxMSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjQuMDUuMTkg
YXQgMTU6MTUsIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+PiAtLS0gYS94ZW4vYXJjaC94ODYv
bW0vcDJtLmMKPj4gKysrIGIveGVuL2FyY2gveDg2L21tL3AybS5jCj4+IEBAIC0xNzA1LDcgKzE3
MDUsNyBAQCB2b2lkIHAybV9tZW1fcGFnaW5nX3BvcHVsYXRlKHN0cnVjdCBkb21haW4gKmQsIHVu
c2lnbmVkIGxvbmcgZ2ZuX2wpCj4+ICAKPj4gICAgICAvKiBXZSdyZSBwYWdpbmcuIFRoZXJlIHNo
b3VsZCBiZSBhIHJpbmcgKi8KPj4gICAgICBpbnQgcmMgPSB2bV9ldmVudF9jbGFpbV9zbG90KGQs
IGQtPnZtX2V2ZW50X3BhZ2luZyk7Cj4+IC0gICAgaWYgKCByYyA9PSAtRU5PU1lTICkKPj4gKyAg
ICBpZiAoIHJjID09IC1FT1BOT1RTVVBQICkKPiAKPiBQZXJoYXBzIHdoaWxlIGNvbW1pdHRpbmcg
KG9yIGlmIGEgdjIgc2hvdWxkIGJlY29tZSBuZWNlc3NhcnkpCj4gdGhlIG1pc3NpbmcgYmxhbmsg
bGluZSBjb3VsZCBiZSBhZGRlZCBoZXJlIGF0IHRoZSBzYW1lIHRpbWUuCgpJJ2xsIHNlbmQgYSBW
MiB3aXRoIHRoZSB0d28gbWlzc2luZyBFTk9TWVMgcmVwbGFjZW1lbnRzLgoKCkp1ZXJnZW4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
