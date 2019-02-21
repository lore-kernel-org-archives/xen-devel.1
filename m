From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: Reducing or removing direct map from xen (was Re:
 Ongoing/future speculative mitigation work)
Date: Thu, 21 Feb 2019 10:59:41 +0100
Message-ID: <20190221095941.6ssrgwiugcr7vtb3@Air-de-Roger>
References: <e3219697-0759-39fc-2486-715cdec1ca9e@citrix.com>
 <20190124114455.eyke5dvkqsxhklav@zion.uk.xensource.com>
 <20190220122901.6kvc7ibyjo4uyzke@zion.uk.xensource.com>
 <20190220130052.b22syaca6cswc3pk@Air-de-Roger>
 <20190220130956.tkhsmdojzdf4nc7x@zion.uk.xensource.com>
 <20190220170809.jr6neinf5beescf4@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dj2S=Q4=citrix.com=prvs=9488a9425=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gwl9C-0003dc-OI
 for xen-devel@lists.xenproject.org; Thu, 21 Feb 2019 10:00:06 +0000
Content-Disposition: inline
In-Reply-To: <20190220170809.jr6neinf5beescf4@zion.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Martin Pohlack <mpohlack@amazon.de>, Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>, Joao Martins <joao.m.martins@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>, Daniel Kiper <daniel.kiper@oracle.com>, Marek Marczykowski <marmarek@invisiblethingslab.com>, Anthony Liguori <aliguori@amazon.com>, Xen-devel <xen-devel@lists.xenproject.org>, "Dannowski, Uwe" <uwed@amazon.de>, Lars Kurth <lars.kurth@citrix.com>, Konrad Wilk <konrad.wilk@oracle.com>, Ross Philipson <ross.philipson@oracle.com>, Dario Faggioli <dfaggioli@suse.com>, Matt Wilson <msw@amazon.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <JGross@suse.com>, Sergey Dyasli <sergey.dyasli@citrix.com>, George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Mihai =?utf-8?B?RG9uyJt1?= <mdontu@bitdefender.com>, "Woodhouse,
 David" <dwmw@ama>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBGZWIgMjAsIDIwMTkgYXQgMDU6MDg6MDlQTSArMDAwMCwgV2VpIExpdSB3cm90ZToK
PiBPbiBXZWQsIEZlYiAyMCwgMjAxOSBhdCAwMTowOTo1NlBNICswMDAwLCBXZWkgTGl1IHdyb3Rl
Ogo+IFsuLi5dCj4gPiBJIHRoaW5rIHVuZGVyLWFsbG9jYXRlLXRoZW4tbWFwIGxvb2tzIHBsYXVz
aWJsZS4geG1hbGxvYyB3aWxsIG5lZWQKPiA+IHRvIGFsbG9jYXRlIHBhZ2VzLCBwdXQgdGhlbSBp
bnRvIGFuIGFycmF5IGFuZCBjYWxsIF9fdm1hcCBvbiB0aGF0IGFycmF5Cj4gPiBkaXJlY3RseS4K
PiAKPiBUaGUgYmlnZ2VzdCBpc3N1ZSB3aXRoIHRoaXMgYXBwcm9hY2ggaXMgdGhhdCB3ZSBub3cg
bmVlZCBhbiBhcnJheSBvZgo+IDFVTDw8TUFYX09SREVSIHRvIGFjY29tbW9kYXRlIG1mbnMuIEJh
Y2sgb2YgZW52ZWxvcGUgY2FsY3VsYXRpb246IG9uIHg4Ngo+IHRoaXMgaXMgZ29pbmcgdG8gYmUg
KDFVTDw8MjApKjggYnl0ZXMgbG9uZy4gVGhpcyBpcyBub3QgZmVhc2libGUuCgpSaWdodC4gSSBn
dWVzcyB0aGUgb25seSByZW1haW5pbmcgb3B0aW9uIGlzIHRvIGFsbG9jYXRlIGEgdmlydHVhbAph
ZGRyZXNzIHNwYWNlIGFuZCBwb3B1bGF0ZSBpdCB1c2luZyBtdWx0aXBsZSBwYWdlcz8KClRoYXQg
d291bGQgbGlrZWx5IHJlcXVpcmUgdG8gc3BsaXQgc29tZSBmdW5jdGlvbnMgaW50byBzbWFsbGVy
IGhlbHBlcnMKc28geW91IGNhbiBjYWxsIHRoZW0gYW5kIHByb3ZpZGUgdGhlIHZpcnR1YWwgYWRk
cmVzcyB3aGVyZSBhIHBhZ2UKc2hvdWxkIGJlIG1hcHBlZD8KClJvZ2VyLgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
