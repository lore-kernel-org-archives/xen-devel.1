From: Chris Patterson <cjp256@gmail.com>
Subject: Re: [PATCH 00/25] Argo: hypervisor-mediated interdomain
 communication
Date: Tue, 11 Dec 2018 17:13:38 -0500
Message-ID: <CABZSBQdhqPKB-kOf_bK=9z3hgEDk6_rnT+P8XnOm0jvn-k3Z+Q@mail.gmail.com>
References: <1543627984-21394-1-git-send-email-christopher.w.clark@gmail.com>
 <CABZSBQfWpW7ZmnzFrgrjA+REzn8zzpYeWB3yXshPuPYDHGVdvA@mail.gmail.com>
 <CACMJ4Gb3CvL6ZDXvZrL=s=BEHxvEagPbkKd6HjXk7-6cuXUeCQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ctsd=OU=gmail.com=cjp256@srs-us1.protection.inumbo.net>)
 id 1gWqHn-0003Ys-4K
 for xen-devel@lists.xenproject.org; Tue, 11 Dec 2018 22:13:51 +0000
Received: by mail-it1-x12e.google.com with SMTP id z7so6119534iti.0
 for <xen-devel@lists.xenproject.org>; Tue, 11 Dec 2018 14:13:50 -0800 (PST)
In-Reply-To: <CACMJ4Gb3CvL6ZDXvZrL=s=BEHxvEagPbkKd6HjXk7-6cuXUeCQ@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: jandryuk@gmail.com, dpsmith@apertussolutions.com, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Tim Deegan <tim@xen.org>, xen-devel@lists.xenproject.org, Jean Guyader <jean.guyader@gmail.com>, Lars Kurth <lars.kurth@citrix.com>, Ross Philipson <ross.philipson@gmail.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, paul.durrant@citrix.com, Juergen Gross <jgross@suse.com>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, voreekf@madingley.org, Rich Persaud <persaur@gmail.com>, dgdegra@tycho.nsa.gov, eric chanudet <eric.chanudet@gmail.com>, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBEZWMgNCwgMjAxOCBhdCA0OjAwIEFNIENocmlzdG9waGVyIENsYXJrCjxjaHJpc3Rv
cGhlci53LmNsYXJrQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiBNb24sIERlYyAzLCAyMDE4IGF0
IDg6NDkgQU0gQ2hyaXMgUGF0dGVyc29uIDxjanAyNTZAZ21haWwuY29tPiB3cm90ZToKPiA+Cj4g
PiA+ID09IEZ1dHVyZSBpdGVtcwo+ID4gPgo+ID4gPiBUaGUgTGludXggZGV2aWNlIGRyaXZlciB1
c2VkIHRvIHRlc3QgdGhpcyBzb2Z0d2FyZSBpcyBkZXJpdmVkIGZyb20gdGhlCj4gPiA+IE9wZW5Y
VCB2NHYgTGludXggZGV2aWNlIGRyaXZlciwgYXZhaWxhYmxlIGF0Ogo+ID4gPiAgICAgaHR0cHM6
Ly9naXRodWIuY29tL09wZW5YVC92NHYKPiA+ID4gVGhlIEFyZ28gaW1wbGVtZW50YXRpb24gaXMg
bm90IHlldCByZWFkeSB0byBwdWJsaXNoIChmb2N1cyBoYXMgYmVlbiBvbgo+ID4gPiB0aGUgaHlw
ZXJ2aXNvciBjb2RlIHRvIHRoaXMgcG9pbnQpLiBBIExpbnV4IGRldmljZSBkcml2ZXIgc3VpdGFi
bGUgZm9yCj4gPiA+IGluY2x1c2lvbiBpbiBYZW4gd2lsbCBiZSBzdWJtaXR0ZWQgZm9yIGEgZnV0
dXJlIFhlbiByZWxlYXNlIGFuZAo+ID4gPiBpbmNvcnBvcmF0aW9uIGludG8gT3BlblhULgo+ID4g
Pgo+ID4KPiA+IEhleSBDaHJpc3RvcGhlciwgSSBhbSBnbGFkIHlvdSBhcmUgdGFja2xpbmcgdGhp
cy4gIFdoaWxlIHRoZSBMaW51eAo+ID4gZHJpdmVyIGlzIG5vdCByZWFkeSB0byBwdWJsaXNoLCBp
cyB0aGVyZSBhIHZlcnNpb24geW91IGNhbiBzaGFyZSBmb3IKPiA+IHNvbWVvbmUgd2hvIHdhbnRz
IHRvIHRlc3QgdGhpcyBzZXJpZXM/ICBPciBpcyB0aGUgdjR2IGRyaXZlcgo+ID4gY29tcGF0aWJs
ZSBhcy1pcz8KPgo+IEhpIENocmlzLAo+Cj4gVGhhbmtzIGZvciB0aGUgaW50ZXJlc3QgLS0gc286
IG9rLCBmb3IgeW91IHRvIHRha2UgYSBsb29rIGFuZCB0bwo+IGVuYWJsZSB0ZXN0aW5nIGJ5IGFu
eW9uZSB3aG8gd291bGQgbGlrZSB0bzogSSd2ZSBqdXN0IHB1c2hlZCBhIGNvcHkgb2YKPiB0aGUg
QXJnbyBwb3J0ZWQgTGludXggZHJpdmVyIGFuZCB1c2Vyc3BhY2UgaW50ZXJwb3NlciwgZXRjLiwg
d2l0aCBzb21lCj4gT3BlbkVtYmVkZGVkIGJ1aWxkIGludGVncmF0aW9uIGFuZCBpbnN0cnVjdGlv
bnMsIHRvIG15IGdpdGh1YiBhY2NvdW50Cj4gaGVyZToKPgo+IGh0dHBzOi8vZ2l0aHViLmNvbS9k
b3p5bHlueC9tZXRhLWFyZ28tbGludXgKPgo+IFRoaXMgYSBwcmV0dHkgZmFzdCBwb3J0IG9mIHRo
ZSB2NHYgTGludXggc29mdHdhcmUgdG8gdXNlIHRoZSBhcmdvCj4gaW50ZXJmYWNlcyAtLSB0aGUg
ZXhpc3RpbmcgT3BlblhUIHY0diBpbnRlcmZhY2UgaXMgbm90IHF1aXRlIHRoZSBzYW1lCj4gLS0g
cGx1cyBtZXRhZGF0YSBpbiB0aGVyZSB0byB0dXJuIGl0IGludG8gYSBuZXcgT3BlbkVtYmVkZGVk
IGxheWVyIGluCj4gdGhlIHNhbWUgcmVwbyB3aXRoIHJlY2lwZXMgdG8gd29yayB3aXRoIG1ldGEt
dmlydHVhbGl6YXRpb24uIEkndmUgYmVlbgo+IGJ1aWxkaW5nIHdpdGggdGhlIHJvY2tvIHJlbGVh
c2UsIGp1c3QgdG8gcGljayBhIHN0YWJsZSByZWZlcmVuY2UKPiBwb2ludCwgc28gaXQncyB0aGUg
cm9ja28gYnJhbmNoIGluIG1ldGEtYXJnby1saW51eCB0aGF0IHlvdSdsbCB3YW50IHRvCj4gbG9v
ayBhdCwgYW5kIHRoZXJlIGFyZSBpbnN0cnVjdGlvbnMgaW4gdGhlIFJFQURNRS5tZCBpbiB0aGF0
IGJyYW5jaC4KPgo+IElmIHlvdSBidWlsZCB0aGF0IHBlciB0aGUgaW5zdHJ1Y3Rpb25zLCBqdXN0
IGEgaGVhZHMgdXAgdGhhdCB0aGUgWGVuCj4gcmVjaXBlIGluIHRoZXJlIHdpbGwgcHVsbCBmcm9t
IGEgcmVjZW50IHNuYXBzaG90IG9mIFhlbidzIHN0YWdpbmcKPiBicmFuY2gsIHdpdGggdGhlIHBv
c3RlZCBBcmdvIHNlcmllcyBhcHBsaWVkLCBmcm9tIGEgY29weSBvbiBteSBnaXRodWIKPiBhY2Nv
dW50Lgo+Cj4gSWYgeW91IGdpdmUgaXQgYSBzcGluLCBsZXQgbWUga25vdyBob3cgaXQgZ29lcy4K
PgoKVGhhbmsgeW91ISBXaWxsIGRvLiA6RAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
