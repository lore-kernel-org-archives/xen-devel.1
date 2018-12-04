From: Christopher Clark <christopher.w.clark@gmail.com>
Subject: Re: [PATCH 00/25] Argo: hypervisor-mediated interdomain
 communication
Date: Tue, 4 Dec 2018 01:00:12 -0800
Message-ID: <CACMJ4Gb3CvL6ZDXvZrL=s=BEHxvEagPbkKd6HjXk7-6cuXUeCQ@mail.gmail.com>
References: <1543627984-21394-1-git-send-email-christopher.w.clark@gmail.com>
 <CABZSBQfWpW7ZmnzFrgrjA+REzn8zzpYeWB3yXshPuPYDHGVdvA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=3zo+=on=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1gU6Z9-0007LO-Nv
 for xen-devel@lists.xenproject.org; Tue, 04 Dec 2018 09:00:27 +0000
Received: by mail-lf1-x12d.google.com with SMTP id c16so11332190lfj.8
 for <xen-devel@lists.xenproject.org>; Tue, 04 Dec 2018 01:00:26 -0800 (PST)
In-Reply-To: <CABZSBQfWpW7ZmnzFrgrjA+REzn8zzpYeWB3yXshPuPYDHGVdvA@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Chris Patterson <cjp256@gmail.com>
Cc: Jason Andryuk <jandryuk@gmail.com>, Daniel Smith <dpsmith@apertussolutions.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Tim Deegan <tim@xen.org>, xen-devel <xen-devel@lists.xenproject.org>, Jean Guyader <jean.guyader@gmail.com>, Lars Kurth <lars.kurth@citrix.com>, Ross Philipson <ross.philipson@gmail.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Paul Durrant <paul.durrant@citrix.com>, Juergen Gross <jgross@suse.com>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, James McKenzie <voreekf@madingley.org>, Rich Persaud <persaur@gmail.com>, dgdegra <dgdegra@tycho.nsa.gov>, eric chanudet <eric.chanudet@gmail.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBEZWMgMywgMjAxOCBhdCA4OjQ5IEFNIENocmlzIFBhdHRlcnNvbiA8Y2pwMjU2QGdt
YWlsLmNvbT4gd3JvdGU6Cj4KPiA+ID09IEZ1dHVyZSBpdGVtcwo+ID4KPiA+IFRoZSBMaW51eCBk
ZXZpY2UgZHJpdmVyIHVzZWQgdG8gdGVzdCB0aGlzIHNvZnR3YXJlIGlzIGRlcml2ZWQgZnJvbSB0
aGUKPiA+IE9wZW5YVCB2NHYgTGludXggZGV2aWNlIGRyaXZlciwgYXZhaWxhYmxlIGF0Ogo+ID4g
ICAgIGh0dHBzOi8vZ2l0aHViLmNvbS9PcGVuWFQvdjR2Cj4gPiBUaGUgQXJnbyBpbXBsZW1lbnRh
dGlvbiBpcyBub3QgeWV0IHJlYWR5IHRvIHB1Ymxpc2ggKGZvY3VzIGhhcyBiZWVuIG9uCj4gPiB0
aGUgaHlwZXJ2aXNvciBjb2RlIHRvIHRoaXMgcG9pbnQpLiBBIExpbnV4IGRldmljZSBkcml2ZXIg
c3VpdGFibGUgZm9yCj4gPiBpbmNsdXNpb24gaW4gWGVuIHdpbGwgYmUgc3VibWl0dGVkIGZvciBh
IGZ1dHVyZSBYZW4gcmVsZWFzZSBhbmQKPiA+IGluY29ycG9yYXRpb24gaW50byBPcGVuWFQuCj4g
Pgo+Cj4gSGV5IENocmlzdG9waGVyLCBJIGFtIGdsYWQgeW91IGFyZSB0YWNrbGluZyB0aGlzLiAg
V2hpbGUgdGhlIExpbnV4Cj4gZHJpdmVyIGlzIG5vdCByZWFkeSB0byBwdWJsaXNoLCBpcyB0aGVy
ZSBhIHZlcnNpb24geW91IGNhbiBzaGFyZSBmb3IKPiBzb21lb25lIHdobyB3YW50cyB0byB0ZXN0
IHRoaXMgc2VyaWVzPyAgT3IgaXMgdGhlIHY0diBkcml2ZXIKPiBjb21wYXRpYmxlIGFzLWlzPwoK
SGkgQ2hyaXMsCgpUaGFua3MgZm9yIHRoZSBpbnRlcmVzdCAtLSBzbzogb2ssIGZvciB5b3UgdG8g
dGFrZSBhIGxvb2sgYW5kIHRvCmVuYWJsZSB0ZXN0aW5nIGJ5IGFueW9uZSB3aG8gd291bGQgbGlr
ZSB0bzogSSd2ZSBqdXN0IHB1c2hlZCBhIGNvcHkgb2YKdGhlIEFyZ28gcG9ydGVkIExpbnV4IGRy
aXZlciBhbmQgdXNlcnNwYWNlIGludGVycG9zZXIsIGV0Yy4sIHdpdGggc29tZQpPcGVuRW1iZWRk
ZWQgYnVpbGQgaW50ZWdyYXRpb24gYW5kIGluc3RydWN0aW9ucywgdG8gbXkgZ2l0aHViIGFjY291
bnQKaGVyZToKCmh0dHBzOi8vZ2l0aHViLmNvbS9kb3p5bHlueC9tZXRhLWFyZ28tbGludXgKClRo
aXMgYSBwcmV0dHkgZmFzdCBwb3J0IG9mIHRoZSB2NHYgTGludXggc29mdHdhcmUgdG8gdXNlIHRo
ZSBhcmdvCmludGVyZmFjZXMgLS0gdGhlIGV4aXN0aW5nIE9wZW5YVCB2NHYgaW50ZXJmYWNlIGlz
IG5vdCBxdWl0ZSB0aGUgc2FtZQotLSBwbHVzIG1ldGFkYXRhIGluIHRoZXJlIHRvIHR1cm4gaXQg
aW50byBhIG5ldyBPcGVuRW1iZWRkZWQgbGF5ZXIgaW4KdGhlIHNhbWUgcmVwbyB3aXRoIHJlY2lw
ZXMgdG8gd29yayB3aXRoIG1ldGEtdmlydHVhbGl6YXRpb24uIEkndmUgYmVlbgpidWlsZGluZyB3
aXRoIHRoZSByb2NrbyByZWxlYXNlLCBqdXN0IHRvIHBpY2sgYSBzdGFibGUgcmVmZXJlbmNlCnBv
aW50LCBzbyBpdCdzIHRoZSByb2NrbyBicmFuY2ggaW4gbWV0YS1hcmdvLWxpbnV4IHRoYXQgeW91
J2xsIHdhbnQgdG8KbG9vayBhdCwgYW5kIHRoZXJlIGFyZSBpbnN0cnVjdGlvbnMgaW4gdGhlIFJF
QURNRS5tZCBpbiB0aGF0IGJyYW5jaC4KCklmIHlvdSBidWlsZCB0aGF0IHBlciB0aGUgaW5zdHJ1
Y3Rpb25zLCBqdXN0IGEgaGVhZHMgdXAgdGhhdCB0aGUgWGVuCnJlY2lwZSBpbiB0aGVyZSB3aWxs
IHB1bGwgZnJvbSBhIHJlY2VudCBzbmFwc2hvdCBvZiBYZW4ncyBzdGFnaW5nCmJyYW5jaCwgd2l0
aCB0aGUgcG9zdGVkIEFyZ28gc2VyaWVzIGFwcGxpZWQsIGZyb20gYSBjb3B5IG9uIG15IGdpdGh1
YgphY2NvdW50LgoKSWYgeW91IGdpdmUgaXQgYSBzcGluLCBsZXQgbWUga25vdyBob3cgaXQgZ29l
cy4KCnRoYW5rcywKCkNocmlzdG9waGVyCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
