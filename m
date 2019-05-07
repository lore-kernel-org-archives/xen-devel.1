From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 0/4] x86/HVM: implement memory read
 caching
Date: Tue, 07 May 2019 10:26:33 -0600
Message-ID: <5CD1B1B9020000780022C9E0@prv1-mh.provo.novell.com>
References: <5B97BEB202000078001E73FB@prv1-mh.provo.novell.com>
 <e2c8634a-16cf-7b03-9818-e2e131625c5f@citrix.com>
 <5BC0AD5E02000078001F10AE@prv1-mh.provo.novell.com>
 <91207b4d-bb5b-b66d-c640-9f6a98ddb35e@citrix.com>
 <87c83237-0ac6-87bb-54d2-c6965dd75270@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=VLhp=TH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hO2vP-0008WE-Dt
 for xen-devel@lists.xenproject.org; Tue, 07 May 2019 16:26:39 +0000
In-Reply-To: <87c83237-0ac6-87bb-54d2-c6965dd75270@citrix.com>
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul.durrant@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA3LjA1LjE5IGF0IDE4OjIyLCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPiB3cm90
ZToKPiBCVFcgSSdtIG5vdyBkZWxldGluZyB0aGlzIGZyb20gbXkgaW5ib3ggdG8gYXZvaWQgY2x1
dHRlci4gIEphbiwgYXQgc3VjaAo+IHRpbWUgYXMgeW91IHdhbnQgbWUgdG8gcmV2aWV3IGl0LCBw
bGVhc2UgcGluZyBvciByZS1zZW5kLgoKVGhhdCdzIGZpbmUgLSB0aGlzIGlzIG1lYW50IHRvIGJl
IHJlLXdvcmtlZC4gSnVzdCBkaWRuJ3QgZ2V0IHRvIGl0IHlldC4KCkphbgoKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
