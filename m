From: Sander Eikelenboom <linux@eikelenboom.it>
Subject: Re: [Notes for xen summit 2018 design session] Process
 changes: is the 6 monthly release Cadence too short, Security Process, ...
Date: Thu, 5 Jul 2018 19:47:25 +0200
Message-ID: <b04068ab-09e3-d90f-1f22-a30cc48046fc@eikelenboom.it>
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
 <1A6F4982-83F9-48DA-8547-09E9CB31D585@citrix.com>
 <23358.21651.273641.311808@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=woxl=jv=eikelenboom.it=linux@srs-us1.protection.inumbo.net>)
 id 1fb8Ls-0007ux-Jz
 for xen-devel@lists.xenproject.org; Thu, 05 Jul 2018 17:47:32 +0000
In-Reply-To: <23358.21651.273641.311808@mariner.uk.xensource.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>, George Dunlap <George.Dunlap@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Lars Kurth <lars.kurth@citrix.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, "advisory-board@lists.xenproject.org" <advisory-board@lists.xenproject.org>, Doug Goldstein <cardoe@cardoe.com>, Rich Persaud <persaur@gmail.com>, "committers@xenproject.org" <committers@xenproject.org>, xen-devel <xen-devel@lists.xenproject.org>, Matt Spencer <Matt.Spencer@arm.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDUvMDcvMTggMTk6MjUsIElhbiBKYWNrc29uIHdyb3RlOgo+IEdlb3JnZSBEdW5sYXAgd3Jp
dGVzICgiUmU6IFtYZW4tZGV2ZWxdIFtOb3RlcyBmb3IgeGVuIHN1bW1pdCAyMDE4IGRlc2lnbiBz
ZXNzaW9uXSBQcm9jZXNzIGNoYW5nZXM6IGlzIHRoZSA2IG1vbnRobHkgcmVsZWFzZSBDYWRlbmNl
IHRvbyBzaG9ydCwgU2VjdXJpdHkgUHJvY2VzcywgLi4uIik6Cj4+IEkgZG9u4oCZdCByZWFsbHkg
dW5kZXJzdGFuZCB3aHkgeW914oCZcmUgbW9yZSB3b3JyaWVkIGFib3V0IGEgdGVzdAo+PiBjb3Jy
dXB0aW5nIGEgYmFja3VwIHBhcnRpdGlvbiBvciBMVk0gc25hcHNob3QsIHRoYW4gb2YgYSB0ZXN0
Cj4+IGNvcnJ1cHRpbmcgYSBmaWxlc3lzdGVtIGV2ZW4gd2hlbiB0aGUgdGVzdCBhY3R1YWxseSBw
YXNzZWQuICBJIGRvbuKAmXQKPj4gaGF2ZSB0aGUgc2FtZSBleHBlcmllbmNlIHlvdSBkbywgYnV0
IGl0IHNlZW1zIGxpa2UgcmFuZG9tIHN0dWZmIGxlZnQKPj4gb3ZlciBmcm9tIGEgcHJldmlvdXMg
dGVzdCDigJQgZXZlbiBpZiB0aGUgdGVzdCBwYXNzZXMg4oCUIHdvdWxkIGhhdmUKPj4gbW9yZSBv
ZiBhIGNoYW5jZSBvZiBzY3Jld2luZyB1cCBhIGZ1dHVyZSB0ZXN0IHRoYW4gc29tZSBzb3J0IG9m
Cj4+IGNvcnJ1cHRpb24gb2YgYW4gTFZNIHNuYXBzaG90LCBhbmQgZXZlbiBsZXNzIHNvIGEgYmFj
a3VwIHBhcnRpdGlvbi4KPiAKPiBUaGUgZGlmZmVyZW5jZSBpcyB0aGF0IHRoZXNlIGFyZSB0ZXN0
cyAqaW4gdGhlIHNhbWUgZmxpZ2h0Ki4gIFRoYXQKPiBtZWFucyB0aGV5J3JlIHRlc3RpbmcgdGhl
IHNhbWUgc29mdHdhcmUuCj4gCj4gSWYgdGVzdCBBIHBhc3NlcywgYnV0IGNvcnJ1cHRzIHRoZSBk
aXNrIHdoaWNoIGlzIGRldGVjdGVkIGJ5IHRlc3QgQgo+IGJlY2F1c2UgdGhlIGhvc3Qgd2Fzbid0
IHdpcGVkIGluIGJldHdlZW4sIGNhdXNpbmcgdGVzdCBCIHRvIGZhaWwsIHRoZW4KPiB0aGF0IGlz
IGEgZ2VudWluZSB0ZXN0IGZhaWx1cmUgLSBhbGJlaXQgb25lIHdob3NlIHJlcHJvIGNvbmRpdGlv
bnMgYXJlCj4gY29tcGxpY2F0ZWQuICBJJ20gYmV0dGluZyB0aGF0IHRoaXMgd2lsbCBiZSByYXJl
IGVub3VnaCBub3QgdG8gbWF0dGVyLgo+IAo+IElhbi4KPiAKCkkga25vdyBhc3N1bXB0aW9uIGhh
cHBlbnMgdG8gYmUgdGhlIG1vdGhlciBvZiBzb21lIGNoaWxkcmVuIHdpdGggYSBjZXJ0YWluCiJh
dHRpdHVkZSIsIGJ1dApXaXRoIExWTSBpIHRoaW5rIGluIHByYWN0aWNlIHRoZSBjaGFuY2VzIHdv
dWxkIGJlIHByZXR0eSBtaW5pbWFsIGZvciBjb3JydXB0aW9uLgpUaGUgbW9zdCBwcm9taW5lbnQg
dGVzdCB3aGljaCBjb3VsZCBjYXVzZSBpc3N1ZXMgd291bGQgYmUgd2l0aCBhIGxpbnV4LWxpbnVz
ICh1bnN0YWJsZSkga2VybmVsLgpFbHNlIHRoZXJlIHdvdWxkIGJlIGEgdmVyeSB2ZXJ5IGdyYXZl
IGJ1ZyBpbiBlaXRoZXIgYSBzdGFibGUgbGludXgga2VybmVsIG9yIHRoZSBoYXJkd2FyZSBvciB0
aGUgWGVuIHVzZWQgb24gdGhlIHRlc3QgZmxpZ2h0IHdoaWNoIG51a2VzIHNvbWV0aGluZyBxdWl0
ZSBzcGVjaWZpYy4KU2luY2UgeW91IGRvbid0IHVzZSB0aGUgTFZNIExWIHdpdGggdGhlIGJhc2Ug
aW1hZ2UgaXQgc2VsZiBidXQgb25seSB0aGUgc25hcHNob3QgYW5kIHlvdSByZWN5Y2xlIHRoZSBz
bmFwc2hvdCBldmVyeSB0aW1lLgoKVGhlIG90aGVycyBwb2ludHMgeW91IG1lbnRpb25lZCBhYm91
dCBFRkkgZXRjLiBjb3VsZCBiZSBpbnRlcmVzdGluZyB0aG91Z2guCgpPbiB0aGUgb3RoZXIgaGFu
ZCB1c2luZyBhIHNldHVwIHdpdGggTFZNIHdvdWxkbid0IHByb2hpYml0IHlvdSBmcm9tIHJlaW5z
dGFsbGluZyB0aGUgYmFzZSBpbWFnZSB0byBMViBvbiBldmVyeSBmbGlnaHQganVzdAp5b3Ugc2Vl
bSB0byBzdWdnZXN0IGFib3ZlLiBJdCBkb2VzIGhhdmUgdGhlIGJlbmVmaXQgb2YgYmVpbmcgYWJs
ZSB0byBrZWVwIGl0IGFjcm9zcyBmbGlnaHRzIHdpdGggc29tZSBzZWVtaW5nbHkgc2ltcGxlIGFk
anVzdG1lbnRzCndoZW4gaW4gcHJhY3RpY2UgdGhhdCB3b3VsZCBqdXN0IHNlZW0gdG8gd29yayAo
d2l0aCBhbHdheXMgYmVpbmcgYWJsZSB0byByZXZlcnQgdG8gZG9pbmcgYSBuZXcgYmFzZSBpbWFn
ZSBldmVyeSBmbGlnaHQpLgoKQnV0IGkgd2lsbCBsZWF2ZSBpdGF0IHRoaXMgZm9yIG5vdywgaXQg
d2FzIG1lcmVseSBhIHN1Z2dlc3Rpb24gOikuCgotLQpTYW5kZXIKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
