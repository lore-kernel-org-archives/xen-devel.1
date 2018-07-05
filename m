From: Sander Eikelenboom <linux@eikelenboom.it>
Subject: Re: [Notes for xen summit 2018 design session] Process
 changes: is the 6 monthly release Cadence too short, Security Process, ...
Date: Thu, 5 Jul 2018 17:40:25 +0200
Message-ID: <341794021.20180705174025@eikelenboom.it>
References: <0920C595-DA2C-4C5E-B713-40ADB616CC93@citrix.com>
 <60433E7B-455A-45C9-8A6A-B26F5BD8F115@citrix.com>
 <0c8301e7-f9a7-3936-ed82-f858f8edc285@suse.com>
 <AEC3807E-0EC4-4B77-8050-C58D98EA124D@citrix.com>
 <23357.64371.756397.906488@mariner.uk.xensource.com>
 <72BDCB6A-8544-4174-BFAC-432E085CC027@citrix.com>
 <b2d9e2b9-0eba-fade-0a32-d4e9ae04be0b@citrix.com>
 <12bb9c34-424e-b9fd-6797-5f30fcd1be06@suse.com>
 <23358.13791.774484.444256@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=woxl=jv=eikelenboom.it=linux@srs-us1.protection.inumbo.net>)
 id 1fb6N6-0000pq-2Q
 for xen-devel@lists.xenproject.org; Thu, 05 Jul 2018 15:40:40 +0000
In-Reply-To: <23358.13791.774484.444256@mariner.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Lars Kurth <lars.kurth@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "advisory-board@lists.xenproject.org" <advisory-board@lists.xenproject.org>, Doug Goldstein <cardoe@cardoe.com>, George Dunlap <George.Dunlap@citrix.com>, Rich Persaud <persaur@gmail.com>, "committers@xenproject.org" <committers@xenproject.org>, xen-devel <xen-devel@lists.xenproject.org>, Matt Spencer <Matt.Spencer@arm.com>
List-Id: xen-devel@lists.xenproject.org

ClRodXJzZGF5LCBKdWx5IDUsIDIwMTgsIDU6MTQ6MzkgUE0sIHlvdSB3cm90ZToKCj4gSnVlcmdl
biBHcm9zcyB3cml0ZXMgKCJSZTogW1hlbi1kZXZlbF0gW05vdGVzIGZvciB4ZW4gc3VtbWl0IDIw
MTggZGVzaWduIHNlc3Npb25dIFByb2Nlc3MgY2hhbmdlczogaXMgdGhlIDYgbW9udGhseSByZWxl
YXNlIENhZGVuY2UgdG9vIHNob3J0LCBTZWN1cml0eSBQcm9jZXNzLCAuLi4iKToKPj4gU2FtZSBh
cHBsaWVzIHRvIHRoZSBob3N0OiB0aGUgYmFzZSBzeXN0ZW0gKHdpdGhvdXQgdGhlIHRvIGJlIHRl
c3RlZAo+PiBjb21wb25lbnQgbGlrZSBxZW11LCB4ZW4sIG9yIHdoYXRldmVyKSBjb3VsZCBiZSBp
bnN0YWxsZWQganVzdCBieQo+PiBjbG9uaW5nIGEgZGlzay9wYXJ0aXRpb24vbG9naWNhbCB2b2x1
bWUuCgo+IENlcnRhaW5seSBpdCB3b3VsZCBiZSBhIGJhZCBpZGVhIHRvIHVzZSBhbnl0aGluZyAq
b24gdGhlIHRlc3QgaG9zdAo+IGl0c2VsZiogYXMgYSBiYXNpcyBmb3IgYSBzdWJzZXF1ZW50IHRl
c3QuICBUaGUgcHJldmlvdXMgdGVzdCBtaWdodAo+IGhhdmUgY29ycnVwdGVkIGl0LgoKPiBTbyB0
aGF0IG1lYW5zIHRoYXQgb2Z0ZW4sIGFuZCBhdCBsZWFzdCBmcm9tIG9uZSB0ZXN0IGZsaWdodCB0
byB0aGUKPiBuZXh0LCBhbGwgb2YgdGhlIGJhc2UgZG9tMCBPUyBuZWVkcyB0byBiZSBjb3BpZWQg
ZnJvbSBzb21ld2hlcmUgZWxzZQo+IHRvIHRoZSB0ZXN0IGhvc3QuICBUaGlzIGlzIG5vdCBjdXJy
ZW50bHkgYXMgZmFzdCBhcyBpdCBjb3VsZCBiZSwgYnV0Cj4gcnVubmluZyBkLWkgaXMgbm90IG1h
c3NpdmVseSBzbG93ZXIgdGhhbiBzb21ldGhpbmcgbGlrZSBGQUkuCgpob3cgYWJvdXQgdXNpbmcg
KExWTSkgc25hcHNob3R0aW5nICh3aGNoIGRvZXMgQ09XKSBhbmQgZHJvcCB0aGUgc25hcHNob3Rz
IGFmdGVyIGEgdGVzdCA/Ck9ubHkgZG8gYSBuZXcgT1MgaW5zdGFsbCBvbmNlIGEgZGF5L3dlZWsg
KG9yIHBvaW50IHJlbGVhcykgYW5kIG9ubHkgYWZ0ZXIgaGF2aW5nIAphbiBPU1NURVNUIHBhc3Mg
PyAKVGhhdCBzaG91bGQgaGF2ZSBmYWlybHkgbGl0dGxlIG92ZXJoZWFkLgoKLS0KU2FuZGVyCgo+
IFRvIGEgZmFpcmx5IGxhcmdlIGV4dGVudCwgc2ltaWxhciBjb25zaWRlcmF0aW9ucyBhcHBseSB0
byBndWVzdAo+IGltYWdlcy4KCj4+IEVhY2ggaW1hZ2Ugd291bGQgcnVuIHRocm91Z2ggdGhlIHN0
YWdlcyBuZXctPnN0YWdpbmctPnN0YWJsZToKPj4gCj4+IC0gRWFjaCB0aW1lIGEgY29tcG9uZW50
IGlzIHJlbGVhc2VkIGFuIGltYWdlIGlzIGJhc2VkIG9uIChlLmcuIGEgbmV3Cj4+ICAgbWFpbmxp
bmUga2VybmVsKSBhIG5ldyBpbWFnZSBpcyBjcmVhdGVkIGJ5IGluc3RhbGxpbmcgaXQuIEluIGNh
c2UgdGhpcwo+PiAgIHN1Y2NlZWRzLCB0aGUgaW1hZ2UgaXMgbW92ZWQgdG8gdGhlIHN0YWdpbmcg
YXJlYS4KCj4gVGhpcyB3b3VsZCBoYXBwZW4gYSBsb3QgbW9yZSBvZnRlbiB0aGFuIHlvdSBzZWVt
IHRvIGltYWdlLiAgIlJlbGVhZWQiCj4gaGVyZSByZWFsbHkgbWVhbnMgImlzIHVwZGF0ZWQgaW4g
aXRzIGFwcHJvcHJpYXRlIGdpdCBicmFuY2giLgoKPiBVbmxlc3MgeW91IHRoaW5rIHdlIHNob3Vs
ZCBkbyBvdXIgdGVzdGluZyBvZiBYZW4gbWFpbmx5IHdpdGggcmVsZWFzZWQKPiB2ZXJzaW9ucyBv
ZiBMaW51eCBzdGFibGUgYnJhbmNoZXMgKGluIHdoaWNoIGNhc2UsIGdpdmVuIGhvdyBMaW51eAo+
IHN0YWJsZSBicmFuY2hlcyBhcmUgb2Z0ZW4gYnJva2VuLCB3ZSBtaWdodCBiZSBsb25nIG91dCBv
ZiBkYXRlKSwgb3IKPiBvdXIgdGVzdGluZyBvZiBMaW51eCBvbmx5IHdpdGggcG9pbnQgcmVsZWFz
ZXMgb2YgWGVuLCBldGMuCgo+IFRoZSBjdXJyZW50IGFwcHJvYWNoIGlzIG1vc3RseSB0byB0YWtl
IHRoZSBtb3N0IHJlY2VudAo+IHRlc3RlZC1hbmQtd29ya2luZyBnaXQgY29tbWl0IGZyb20gZWFj
aCBvZiB0aGUgaW5wdXRzLiAgVGhpcyBhc3BlY3Qgb2YKPiBvc3N0ZXN0IGdlbmVyYWxseSB3b3Jr
cyB3ZWxsLCBJIHRoaW5rLgoKPiBJYW4uCgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
