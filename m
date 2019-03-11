From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v12] tolerate jitter in cpu_khz calculation
 to avoid TSC emulation
Date: Mon, 11 Mar 2019 04:42:46 -0600
Message-ID: <5C863BA6020000780021D24B@prv1-mh.provo.novell.com>
References: <20190308192059.24610-1-olaf@aepfle.de>
 <20190308202907.56f7609a.olaf@aepfle.de>
 <5C863226020000780021D1DB@prv1-mh.provo.novell.com>
 <20190311112653.0f9997b4.olaf@aepfle.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=dzfJ=RO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h3IOW-0000yy-0a
 for xen-devel@lists.xenproject.org; Mon, 11 Mar 2019 10:42:56 +0000
In-Reply-To: <20190311112653.0f9997b4.olaf@aepfle.de>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Olaf Hering <olaf@aepfle.de>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDExLjAzLjE5IGF0IDExOjI2LCA8b2xhZkBhZXBmbGUuZGU+IHdyb3RlOgo+IEFtIE1v
biwgMTEgTWFyIDIwMTkgMDQ6MDI6MTQgLTA2MDAKPiBzY2hyaWViICJKYW4gQmV1bGljaCIgPEpC
ZXVsaWNoQHN1c2UuY29tPjoKPiAKPj4gPiBPbmUgaW50ZXJlc3RpbmcgYXNwZWN0IGlzOiB0aGUg
eGVubGludXggYmFzZWQga2VybmVscyByZXBvcnQgCj4gY2xvY2tzb3VyY2U9dHNjLCAgCj4+IEkg
ZG9uJ3QgdGhpbmsgdGhleSBkbyAtIGlpcmMgdGhleSBhcmUgaGFyZGNvZGVkIHRvIGNsb2Nrc291
cmNlPXhlbi4KPiAKPiBGb3IgSFZNIHRoZXkgZG86CgpUaGVyZSdzIG5vIHN1Y2ggdGhpbmcgYXMg
YSBYZW5vTGludXggZ3Vlc3QgcnVubmluZyBpbiBIVk0gbW9kZS4gVGhlCm9ubHkgSFZNLXJlbGF0
ZWQgZGVyaXZhdGUgZnJvbSBYZW5vTGludXggYXJlIHRoZSBQViBkcml2ZXJzIHVzZWQgYnkKdGhl
IGNvcnJlc3BvbmRpbmcgdmVyc2lvbiBIVk0gZ3Vlc3RzLiBUaW1lIG1hbmFnZW1lbnQgaW5zaWRl
IHN1Y2gKSFZNIGd1ZXN0cyBpcyBlbnRpcmVseSB1bmFmZmVjdGVkIGJ5IHRoaXMgaWlyYywgaS5l
LiBtYXRjaGVzIHRoYXQgb2YKcGxhaW4gSFZNICh3aXRob3V0IGFueSBQViBleHRlbnNpb25zKS4K
CkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
