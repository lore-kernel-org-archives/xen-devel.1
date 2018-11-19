From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2] xen/pt: fix some pass-thru devices don't
 work across reboot
Date: Mon, 19 Nov 2018 05:55:08 -0700
Message-ID: <5BF2B2AC02000078001FD75D@prv1-mh.provo.novell.com>
References: <1542244226-35003-1-git-send-email-chao.gao@intel.com>
 <20181115104039.geyiusafhsq4q7x4@mac> <20181116075348.GA6684@gao-cwp>
 <20181116093529.4ucjehnm75tulsdq@mac>
 <5BEE950D02000078001FCAFA@prv1-mh.provo.novell.com>
 <20181116143011.z6ydirxyxlf4migk@mac> <20181119124519.GA18130@gao-cwp>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=NNqu=N6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gOj59-0002Gb-Mj
 for xen-devel@lists.xenproject.org; Mon, 19 Nov 2018 12:55:15 +0000
In-Reply-To: <20181119124519.GA18130@gao-cwp>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>, Chao Gao <chao.gao@intel.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE5LjExLjE4IGF0IDEzOjQ1LCA8Y2hhby5nYW9AaW50ZWwuY29tPiB3cm90ZToKPiBB
bm90aGVyIHNvbHV0aW9uIGNhbWUgdG8gbXkgbWluZDoKPiAKPiBUaGUgaW50ZW50aW9uIG9mIFhl
biBzZXR0aW5nICdob3N0X21hc2thbGwnIGlzIHRvIG1hc2sgYSBzaW5nbGUgdmVjdG9yLiBIb3cK
PiBhYm91dCBjb252ZXJ0aW5nIHRoZSBob3N0X21hc2thbGwgdG8gbWFzayBhbGwgdmVjdG9ycyB3
aGVuIFhlbiB0cmllcyB0byBpbml0IAo+IHRoZSBmaXJzdCB2ZWN0b3IgaW4gbXNpeF9jYXBhYmls
aXR5X2luaXQoKT8gQWN0dWFsbHksIG9uIGhhcmR3YXJlLCBhbGwKPiB2ZWN0b3IncyBtYXNrIGJp
dCBpcyBhbHJlYWR5IHNldCB3aGVuIHBjaWJhY2sgaXMgcGVyZm9ybWluZyBkZXZpY2UgcmVzZXQu
IFNvCj4gaXQgd29uJ3QgYnJlYWsgYW55dGhpbmcuIFdpdGggY29tbWl0IDY5ZDk5ZDFiMjIzLCBl
dmVuIGEgZ3Vlc3QgaGFzIGNsZWFyZWQKPiBzb21lIHZlY3RvcnMnIG1hc2sgYml0IGJlZm9yZSB0
aGUgY29udmVydGlvbiwgaXQgd29uJ3QgYmUgYW4gaXNzdWUuCgpCdXQgd2UgYWxyZWFkeSBtYXNr
IHZlY3RvcnMgaW4gbXNpeF9jYXBhYmlsaXR5X2luaXQoKS4gSSB0aG91Z2h0IHdlIGhhZAphbHJl
YWR5IHNldHRsZWQgdGhhdCBpZiB3ZSBjYW1lIHRocm91Z2ggdGhpcyBmdW5jdGlvbiBiZWZvcmUg
YXNzaWduaW5nCnRoZSBkZXZpY2UgdG8gYSAobmV3IG9yIHNhbWUvcmVzdGFydGluZykgZ3Vlc3Qs
IGFsbCBvdWdodCB0byBiZSBmaW5lOgpXaGVuIHdlIGNvbWUgaGVyZSBmb3IgdGhlIGZpcnN0IGVu
dHJ5LCB3ZSBhbHNvIHR1cm4gb2ZmIGhvc3RfbWFza2FsbC4KVGhhdCdzIHdoeSB3ZSd2ZSBiZWVu
IHN1Z2dlc3RpbmcgdG8gZ28gdGhyb3VnaCBhIHJlbGVhc2UvcHJlcGFyZQpjeWNsZS4KCkphbgoK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
