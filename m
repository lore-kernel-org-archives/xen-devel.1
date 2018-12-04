From: Christopher Clark <christopher.w.clark@gmail.com>
Subject: Re: [PATCH 01/25] xen/evtchn: expose
 evtchn_bind_ipi_vcpu0_domain for use within Xen
Date: Tue, 4 Dec 2018 01:17:49 -0800
Message-ID: <CACMJ4GZrp1edJcCy6cxoGWLX0iUWm-hFPXuqJdct_Kv0+1PQwg@mail.gmail.com>
References: <1543627984-21394-1-git-send-email-christopher.w.clark@gmail.com>
 <1543627984-21394-2-git-send-email-christopher.w.clark@gmail.com>
 <5C0557B80200007800202564@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=3zo+=on=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1gU6qC-0000QS-MM
 for xen-devel@lists.xenproject.org; Tue, 04 Dec 2018 09:18:04 +0000
Received: by mail-lf1-x142.google.com with SMTP id p6so11383018lfc.1
 for <xen-devel@lists.xenproject.org>; Tue, 04 Dec 2018 01:18:03 -0800 (PST)
In-Reply-To: <5C0557B80200007800202564@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Ross Philipson <ross.philipson@gmail.com>, Jason Andryuk <jandryuk@gmail.com>, Daniel Smith <dpsmith@apertussolutions.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Rich Persaud <persaur@gmail.com>, James McKenzie <voreekf@madingley.org>, George Dunlap <George.Dunlap@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, eric chanudet <eric.chanudet@gmail.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBEZWMgMywgMjAxOCBhdCA4OjIwIEFNIEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNl
LmNvbT4gd3JvdGU6Cj4KPiA+Pj4gT24gMDEuMTIuMTggYXQgMDI6MzIsIDxjaHJpc3RvcGhlci53
LmNsYXJrQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPiBBbGxvY2F0ZXMgYW4gSVBJLWJvdW5kIGV2ZW50
IGNoYW5uZWwgb24gdmNwdTAgZm9yIHNwZWNpZmllZCBkb21haW4uCj4KPiBQbGVhc2UgY2FuIHN1
Y2ggY2hhbmdlcyB0byBnZW5lcmFsIGNvZGUgYmUgZG9uZSBhdCB0aGUgcG9pbnQgd2hlcmUKPiB0
aGV5J3JlIG5lZWRlZD8KPgo+ID4gSXMgYWJsZSB0byBieXBhc3MgdGhlIGV4aXN0ZW5jZSBjaGVj
ayBvbiB2Y3B1IG51bWJlciBzaW5jZSB2Y3B1IDAKPiA+IHNob3VsZCBhbHdheXMgZXhpc3QuIEJ5
cGFzcyBpcyByZXF1aXJlZCBhdCB0aGUgcG9pbnQgb2YgdXNlIGJ5IEFyZ28uCj4KPiAiU2hvdWxk
IiBpcyBub3QgYSBzdWZmaWNpZW50IGNyaXRlcmlhLiBBbmQgeW91IGxlYXZlIG9wZW4gd2h5IHN1
Y2ggYQo+IGJ5cGFzcyBtYXkgYmUgbmVlZGVkLgo+Cj4gQXMgYW4gYXNpZGUsIEkgcXVlc3Rpb24g
YW55d2F5IGFueSBuZXcgaW50ZXJmYWNlIHNwZWNpYWwgY2FzaW5nCj4gdkNQVSAwLgoKQWNrLiBJ
J2xsIHRha2UgYSBsb29rIGF0IGhvdyB0aGlzIGluaXRpYWxpemF0aW9uIGludGVyYWN0cyB3aXRo
CmRvbWFpbnMgd2l0aCBubyBWQ1BVcy4gQWdyZWUgdGhhdCB0aGUgdmNwdTAgc3BlY2lhbC1jYXNl
IGRlc2VydmVzCnF1ZXN0aW9uaW5nLiBUaGFua3MuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
