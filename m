From: Sander Eikelenboom <linux@eikelenboom.it>
Subject: Re: [Notes for xen summit 2018 design session] Process
 changes: is the 6 monthly release Cadence too short, Security Process, ...
Date: Thu, 5 Jul 2018 19:06:30 +0200
Message-ID: <a0fb7723-8d48-4f34-2f56-b0be8ebb3088@eikelenboom.it>
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
 <23358.17933.141197.826134@mariner.uk.xensource.com>
 <FB11B977-C6B6-4A82-BB05-00D5F701D67B@citrix.com>
 <d5942e06-98cc-63dc-549c-dd3e471ca125@citrix.com>
 <23358.20262.278645.448005@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=woxl=jv=eikelenboom.it=linux@srs-us1.protection.inumbo.net>)
 id 1fb7iJ-0002w4-HE
 for xen-devel@lists.xenproject.org; Thu, 05 Jul 2018 17:06:39 +0000
In-Reply-To: <23358.20262.278645.448005@mariner.uk.xensource.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Lars Kurth <lars.kurth@citrix.com>, "advisory-board@lists.xenproject.org" <advisory-board@lists.xenproject.org>, Doug Goldstein <cardoe@cardoe.com>, George Dunlap <George.Dunlap@citrix.com>, Rich Persaud <persaur@gmail.com>, "committers@xenproject.org" <committers@xenproject.org>, xen-devel <xen-devel@lists.xenproject.org>, Matt Spencer <Matt.Spencer@arm.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDUvMDcvMTggMTk6MDIsIElhbiBKYWNrc29uIHdyb3RlOgo+IEFuZHJldyBDb29wZXIgd3Jp
dGVzICgiUmU6IFtYZW4tZGV2ZWxdIFtOb3RlcyBmb3IgeGVuIHN1bW1pdCAyMDE4IGRlc2lnbiBz
ZXNzaW9uXSBQcm9jZXNzIGNoYW5nZXM6IGlzIHRoZSA2IG1vbnRobHkgcmVsZWFzZSBDYWRlbmNl
IHRvbyBzaG9ydCwgU2VjdXJpdHkgUHJvY2VzcywgLi4uIik6Cj4+IFhlblJULCB3aGljaCBpcyBY
ZW5TZXJ2ZXJzIHByb3Zpc2lvbmluZyBhbmQgdGVzdGluZyBzeXN0ZW0gYW5kIGluc3RhbGwsCj4+
IGNhbiBkZXBsb3kgYXJiaXRyYXJ5IGJ1aWxkcyBvZiBYZW5TZXJ2ZXIsIG9yIGFyYml0cmFyeSBi
dWlsZHMgb2YgdmFyaW91cwo+PiBMaW51eCBkaXN0cm9zIGluIDEwIG1pbnV0ZXMgKGFsdGhvdWdo
IGZvciBkaXN0cm9zLCB3ZSBsaW1pdCBvdXIgaW5zdGFsbAo+PiBtZWRpYSB0byBwdWJsaXNoZWQg
cG9pbnQgcmVsZWFzZXMpLsKgIEdvb2dsZSAiMTAgbWludXRlcyB0byBYZW4iIGZvciBzb21lCj4+
IFBSIG9uIHRoaXMgc3ViamVjdCBkb25lIGJhY2sgaW4gdGhlIGRheSEKPiAKPiBvc3N0ZXN0J3Mg
ZC1pIHJ1bnMgdGFrZSBtb3JlIGxpa2UgMTUgbWludXRlcy4gIEFzIEkgc2F5LCB0aGlzIGNvdWxk
IGJlCj4gaW1wcm92ZWQgYnkgdXNpbmcgc29tZXRoaW5nIGxpa2UgRkFJLCBidXQgYnkgYSBmYWN0
b3Igb2YgYXQgbW9zdCAyIEkKPiB0aGluay4gIEluc3RlYWQgb2Ygd29ya2luZyBvbiB0aGF0LCBJ
IGhhdmUgYmVlbiB3b3JraW5nIG9uIHJldXNpbmcgYW4KPiBpbnN0YWxsIHdoZW4gaXQgaXMgZmVh
c2libGUgdG8gZG8gc286IHNwZWNpZmljYWxseSwgYWZ0ZXIgYSBwYXNzaW5nCj4gam9iIGFuZCB3
aGVuIHRoZSBob3N0IGlzIHRvIGJlIHJldXNlZCBieSB0aGUgc2FtZSBmbGlnaHQsIHdpdGggYW4K
PiBpZGVudGljYWwgY29uZmlndXJhdGlvbi4gIEluIG15IHRlc3RzIHRoYXQgc2F2ZXMgYWJvdXQg
NTAlIG9mIHRoZSBob3N0Cj4gaW5zdGFsbHMuICBJIGhhdmVuJ3QgeWV0IGNvbXBsZXRlZCBhbmQg
ZGVwbG95ZWQgdGhpcy4KPiAKPiBJYW4uCj4gCkp1c3Qgd29uZGVyaW5nLCBhcmUgdGhlcmUgYW55
IHRpbWluZyBzdGF0aXN0aWNzIGtlcHQgZm9yIHRoZSBPU1N0ZXN0CmZsaWdodHMgKGFuZCBzZXBh
cmF0ZSBmb3IgYnVpbGRpbmcgdGhlIHZhcmlvdXMgY29tcG9uZW50cyBhbmQgcnVubmluZwp0aGUg
aW5kaXZpZHVhbCB0ZXN0cyA/KS4gT3Igc2hvdWxkIHRoZXkgYmUgcGFyc2UtYWJsZSBmcm9tIHRo
ZSBsb2dzIGtlcHQgPwoKVGhhdCBjb3VsZCBwZXJoYXBzIGdpdmUgc29tZSBiZXR0ZXIgaW5zaWdo
dCBpbiB0aGUgYXZlcmFnZSBhbmQgdmFyaWF0aW9uCmluIHRpbWUgc3BlbnQgaW50byBhbGwgdGhl
IGNvbXBvbmVudHMuCi0tClNhbmRlcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
