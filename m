From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [Notes for xen summit 2018 design session] Process
 changes: is the 6 monthly release Cadence too short, Security Process, ...
Date: Thu, 5 Jul 2018 17:23:41 +0100
Message-ID: <23358.17933.141197.826134@mariner.uk.xensource.com>
References: <0920C595-DA2C-4C5E-B713-40ADB616CC93@citrix.com>
 <60433E7B-455A-45C9-8A6A-B26F5BD8F115@citrix.com>
 <0c8301e7-f9a7-3936-ed82-f858f8edc285@suse.com>
 <AEC3807E-0EC4-4B77-8050-C58D98EA124D@citrix.com>
 <23357.64371.756397.906488@mariner.uk.xensource.com>
 <72BDCB6A-8544-4174-BFAC-432E085CC027@citrix.com>
 <b2d9e2b9-0eba-fade-0a32-d4e9ae04be0b@citrix.com>
 <12bb9c34-424e-b9fd-6797-5f30fcd1be06@suse.com>
 <23358.13791.774484.444256@mariner.uk.xensource.com>
 <341794021.20180705174025@eikelenboom.it>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=l63l=jv=citrix.com=prvs=717d132a8=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fb72n-0005sc-S3
 for xen-devel@lists.xenproject.org; Thu, 05 Jul 2018 16:23:45 +0000
In-Reply-To: <341794021.20180705174025@eikelenboom.it>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Sander Eikelenboom <linux@eikelenboom.it>
Cc: Juergen Gross <jgross@suse.com>, Lars Kurth <lars.kurth@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "advisory-board@lists.xenproject.org" <advisory-board@lists.xenproject.org>, Doug Goldstein <cardoe@cardoe.com>, George Dunlap <George.Dunlap@citrix.com>, Rich Persaud <persaur@gmail.com>, "committers@xenproject.org" <committers@xenproject.org>, xen-devel <xen-devel@lists.xenproject.org>, Matt Spencer <Matt.Spencer@arm.com>
List-Id: xen-devel@lists.xenproject.org

U2FuZGVyIEVpa2VsZW5ib29tIHdyaXRlcyAoIlJlOiBbWGVuLWRldmVsXSBbTm90ZXMgZm9yIHhl
biBzdW1taXQgMjAxOCBkZXNpZ24gc2Vzc2lvbl0gUHJvY2VzcyBjaGFuZ2VzOiBpcyB0aGUgNiBt
b250aGx5IHJlbGVhc2UgQ2FkZW5jZSB0b28gc2hvcnQsIFNlY3VyaXR5IFByb2Nlc3MsIC4uLiIp
Ogo+IFRodXJzZGF5LCBKdWx5IDUsIDIwMTgsIDU6MTQ6MzkgUE0sIHlvdSB3cm90ZToKPiA+IFNv
IHRoYXQgbWVhbnMgdGhhdCBvZnRlbiwgYW5kIGF0IGxlYXN0IGZyb20gb25lIHRlc3QgZmxpZ2h0
IHRvIHRoZQo+ID4gbmV4dCwgYWxsIG9mIHRoZSBiYXNlIGRvbTAgT1MgbmVlZHMgdG8gYmUgY29w
aWVkIGZyb20gc29tZXdoZXJlIGVsc2UKPiA+IHRvIHRoZSB0ZXN0IGhvc3QuICBUaGlzIGlzIG5v
dCBjdXJyZW50bHkgYXMgZmFzdCBhcyBpdCBjb3VsZCBiZSwgYnV0Cj4gPiBydW5uaW5nIGQtaSBp
cyBub3QgbWFzc2l2ZWx5IHNsb3dlciB0aGFuIHNvbWV0aGluZyBsaWtlIEZBSS4KPiAKPiBob3cg
YWJvdXQgdXNpbmcgKExWTSkgc25hcHNob3R0aW5nICh3aGNoIGRvZXMgQ09XKSBhbmQgZHJvcCB0
aGUKPiBzbmFwc2hvdHMgYWZ0ZXIgYSB0ZXN0ID8gIE9ubHkgZG8gYSBuZXcgT1MgaW5zdGFsbCBv
bmNlIGEgZGF5L3dlZWsKPiAob3IgcG9pbnQgcmVsZWFzKSBhbmQgb25seSBhZnRlciBoYXZpbmcg
YW4gT1NTVEVTVCBwYXNzID8gIFRoYXQKPiBzaG91bGQgaGF2ZSBmYWlybHkgbGl0dGxlIG92ZXJo
ZWFkLgoKSSdtIHNvcnJ5IHRvIGhhdmUgdG8gc2F5IHRoaXMsIGJ1dCB5b3Ugc2VlbSBub3QgdG8g
aGF2ZSByZWFkIHdoYXQgSQp3cm90ZSBhYm92ZS4KCkxlYXZpbmcgYXNpZGUgb3RoZXIgcXVlc3Rp
b25zIGFib3V0IHVzaW5nIExWTSBmb3IgYSB3aG9sZSBtYWNoaW5lCmluY2x1ZGluZyBwb3NzaWJs
ZSBFRkkgc3lzdGVtIHBhcnRpdGlvbiwgYm9vdGxvYWRlciBldGMuLCB3aGVyZSB3b3VsZAp0aGUg
YmFzZSBpbWFnZSBiZSBmb3IgdGhpcyBMVk0gc25hcHNob3QgPwoKSWYgaXQgaXMgb24gdGhlIGhv
c3QgaXRzZWxmIHRoZW4gdGhlIHByZXZpb3VzIHRlc3QgY2FuIGNvcnJ1cHQgaXQuClRoaXMgaXMg
bm90IHRoZW9yZXRpY2FsOiB3ZSBhcmUgZG9pbmcgT1MgYW5kIGh5cGVydmlzb3IgZGV2ZWxvcG1l
bnQuCkJyZWFrYWdlIGlzIHRvIGJlIGV4cGVjdGVkLgoKSWYgaXQgaXMgbm90IG9uIHRoZSBob3N0
IGl0c2VsZiwgdGhlbiB0aGUgc3lzdGVtIGlzIGRvaW5nIHNvbWUga2luZCBvZgpuZXR3b3JrIGNv
dyBsdm0gdGhpbmcuICBUaGF0IGlzIG5vdCBnb2luZyB0byBpbXByb3ZlIHRoZSB0ZXN0CnJlbGlh
YmlsaXR5LiAgQW5kIGl0IGlzIHVucmVsaWFiaWxpdHkgd2hpY2ggaXMgb3VyIG1haW4gcHJvYmxl
bS4KCklhbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
