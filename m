From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: Reducing or removing direct map from xen (was Re:
 Ongoing/future speculative mitigation work)
Date: Wed, 20 Feb 2019 12:29:01 +0000
Message-ID: <20190220122901.6kvc7ibyjo4uyzke@zion.uk.xensource.com>
References: <e3219697-0759-39fc-2486-715cdec1ca9e@citrix.com>
 <20190124114455.eyke5dvkqsxhklav@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RPnU=Q3=citrix.com=prvs=947cb6223=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gwR1S-0004tg-Ir
 for xen-devel@lists.xenproject.org; Wed, 20 Feb 2019 12:30:46 +0000
Content-Disposition: inline
In-Reply-To: <20190124114455.eyke5dvkqsxhklav@zion.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Martin Pohlack <mpohlack@amazon.de>, Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>, Joao Martins <joao.m.martins@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>, Daniel Kiper <daniel.kiper@oracle.com>, Marek Marczykowski <marmarek@invisiblethingslab.com>, Anthony Liguori <aliguori@amazon.com>, "Dannowski, Uwe" <uwed@amazon.de>, Lars Kurth <lars.kurth@citrix.com>, Konrad Wilk <konrad.wilk@oracle.com>, Ross Philipson <ross.philipson@oracle.com>, Dario Faggioli <dfaggioli@suse.com>, Matt Wilson <msw@amazon.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <JGross@suse.com>, Sergey Dyasli <sergey.dyasli@citrix.com>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Mihai =?utf-8?B?RG9uyJt1?= <mdontu@bitdefender.com>, "Woodhouse,
 David" <dwmw@amazon.co.uk>Ro
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBKYW4gMjQsIDIwMTkgYXQgMTE6NDQ6NTVBTSArMDAwMCwgV2VpIExpdSB3cm90ZToK
PiAzLiBJbXBsZW1lbnQgeGVuaGVhcCB1c2luZyB2bWFwIGluZnJhc3RydWN0dXJlCj4gCj4gVGhp
cyBoZWxwcyBwcmVzZXJ2ZSB4ZW5oZWFwJ3MgImFsd2F5cyBtYXBwZWQiIHByb3BlcnR5LiBBdCB0
aGUgbW9tZW50LAo+IHZtYXAgcmVsaWVzIG9uIHhlbmhlYXAsIHdlIHdhbnQgdG8gdHVybiB0aGlz
IHJlbGF0aW9uc2hpcCBhcm91bmQuCj4gCj4gVGhlcmUgaXMgYSBsb29wIHdoYXQgbmVlZHMgYnJl
YWtpbmcgaW4gdGhlIG5ldyB3b3JsZDoKPiAKPiAgIGFsbG9jX3hlbmhlYXBfcGFnZXMgLT4gdm1h
cCAtPiBfX3ZtYXAgLT4gbWFwX3BhZ2VzX3RvX3hlbiAtPgo+ICAgICB2aXJ0X3RvX3hlbl9sMWUg
LT4gYWxsb2NfeGVuX3BhZ2V0YWJsZSAtPiBhbGxvY194ZW5oZWFwX3BhZ2UgLT4gdm1hcCAuLi4K
PiAKPiBUd28gb3B0aW9ucyB3ZXJlIHByb3Bvc2VkIHRvIGJyZWFrIHRoaXMgbG9vcDoKPiAKPiAg
IDMuMSBQcmUtcG9wdWxhdGUgYWxsIHBhZ2UgdGFibGVzIGZvciB2bWFwIHJlZ2lvbgoKTm93IHRo
YXQgd2UgaGF2ZSB0aGlzIC4uLgoKPiAgIDMuMiBTd2l0Y2ggcGFnZSB0YWJsZSBhbGxvY2F0aW9u
IHRvIHVzZSBkb21oZWFwIHBhZ2UKPiAKPiAKPiBUaGUgb3RoZXIgd29yayBpdGVtIGlzIHRvIHRy
YWNrIHBhZ2U8LT52aXJ0IHJlbGF0aW9uc2hpcCBzbyB0aGF0Cj4gY29udmVyc2lvbiBmdW5jdGlv
bnMgKF90b192aXJ0IGV0YykgY29udGludWUgdG8gd29yay4gRm9yIFBvQyBwdXJwb3NlLAo+IHB1
dHRpbmcgYSB2b2lkICogaW50byBwYWdlX2luZm8gaXMgZ29vZCBlbm91Z2guIEJ1dCBpbiB0aGUg
ZnV0dXJlIHdlCj4gd2FudCB0byBoYXZlIGEgc2VwYXJhdGUgYXJyYXkgZm9yIHRyYWNraW5nIHNv
IHRoYXQgcGFnZV9pbmZvIHN0YXlzIHBvd2VyCj4gb2YgdHdvIGluIHNpemUuCj4gCgpJIHN0YXJ0
ZWQgd29ya2luZyBvbiBzb21lIHByb3RvdHlwaW5nIGNvZGUgZm9yIHRoZSByZXN0IG9mIHRoaXMg
bWFqb3IKd29yayBpdGVtLiBDb252ZXJzaW9uIGZ1bmN0aW9ucyBhcmUgYSBiaXQgbWVzc3kgdG8g
ZGVhbCB3aXRoIChJIGhhdmUgbm8KaWRlYSB3aGV0aGVyIG15IG1vZGlmaWNhdGlvbnMgYXJlIHRv
dGFsbHkgY29ycmVjdCBhdCB0aGlzIHBvaW50KSwgYnV0CnRoZSBtb3N0IG1ham9yIGlzc3VlIEkg
c2VlIGlzIGFuIG9wdGltaXNhdGlvbiBkb25lIGJ5IHhtYWxsb2Mgd2hpY2gKaXNuJ3QgY29tcGF0
aWJsZSB3aXRoIHZtYXAuCgpTbyB4bWFsbG9jIGhhcyB0aGlzIG9wdGltaXNhdGlvbjogaXQgd2ls
bCBhbGxvY2F0ZSBhIGhpZ2gtb3JkZXIgcGFnZQpmcm9tIHhlbmhlYXAgd2hlbiBuZWNlc3Nhcnkg
YW5kIHRoZW4gYXR0ZW1wdCB0byBicmVhayB0aGF0IHVwIGFuZCByZXR1cm4KdGhlIHVudXNlZCBw
b3J0aW9uLiAgVm1hcCB1c2VzIGJpdG1hcCB0byB0cmFjayBhZGRyZXNzIHNwYWNlIHVzYWdlLCBh
bmQKaXQgbWFuZGF0ZXMgYSBndWFyZCBwYWdlIGJlZm9yZSBldmVyeSBhZGRyZXNzIHNwYWNlIGFs
bG9jYXRpb24uIFdoYXQKeG1hbGxvYyBkb2VzIGlzIHRvIGZyZWUgYSBwb3J0aW9uIG9mIHRoZSBh
ZGRyZXNzIHNwYWNlLCB3aGljaCBpc24ndApyZWFsbHkgc3VwcG9ydGVkIGJ5IHZtYXAuCgpJIGNh
bWUgdXAgd2l0aCB0d28gb3B0aW9ucyB5ZXN0ZXJkYXk6CgoxLiBSZW1vdmUgdGhlIG9wdGltaXNh
dGlvbiBpbiB4bWFsbG9jCjIuIE1ha2Ugdm1hcCBhYmxlIHRvIGJyZWFrIHVwIGFsbG9jYXRpb24K
Ck5laXRoZXIgbG9va3MgZ3JlYXQgdG8gbWUuIFRoZSBmaXJzdCBpcyBzaW1wbGUgYnV0IHBvdGVu
dGlhbGx5IHdhc3RlZnVsCihob3cgbXVjaCBpcyB3YXN0ZWQ/KS4gVGhlIHNlY29uZCByZXF1aXJl
cyBub24tdHJpdmlhbCBtb2RpZmljYXRpb24gdG8Kdm1hcCwgZXNzZW50aWFsbHkgcmVtb3Zpbmcg
dGhlIG1hbmRhdG9yeSBndWFyZCBwYWdlLiBJbiBjb21wYXJpc29uIHRoZQpmaXJzdCBpcyBlYXNp
ZXIgYW5kIHNhZmVyLgoKSSB3b3VsZCBsaWtlIHRvIGhlYXIgcGVvcGxlJ3MgdGhvdWdodCBvbiB0
aGlzLiBDb21tZW50cyBhcmUgd2VsY29tZS4KCldlaS4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
