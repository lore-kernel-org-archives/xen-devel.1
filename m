From: Juergen Gross <jgross@suse.com>
Subject: Re: Xen ballooning interface
Date: Tue, 14 Aug 2018 09:47:42 +0200
Message-ID: <61961a81-a7f1-89eb-8f65-0ce529d74bab@suse.com>
References: =?UTF-8?B?PDJiOTJlOGE177+9OWI2Nu+/vTFmZTLvv70xMTRh77+9NWJmOTY3?=
 =?UTF-8?Q?6c9f22@suse.com>_<5B718DB202000078001DD8A9@suse.com>_<9509907f?=
 =?UTF-8?B?77+9M2YzZe+/vTVkMWbvv70yZmI077+9OTkxZjBiNGFhODM0QHN1c2UuY29tPiA8?=
 =?UTF-8?Q?5B71A3EA02000078001DD953@prv1=ef=bf=bdmh.provo.novell.com>_<f4e4b?=
 =?UTF-8?B?Nzdj77+9MGU5Zu+/vTM2ZDHvv705Mzk077+9NzIwZmJiOWQyNDM1QHN1c2UuY29t?=
 =?UTF-8?Q?>_<5B727E7302000078001DDACB@prv1=ef=bf=bdmh.provo.novell.com>_<60?=
 =?UTF-8?Q?ff0fc0-04db-b9e8-077c-2037114f4b77@suse.com>_<5B72860202000078001?=
 =?UTF-8?Q?DDAFF@suse.com>?=
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=z4we=k5=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fpU3O-0002q6-LA
 for xen-devel@lists.xenproject.org; Tue, 14 Aug 2018 07:47:46 +0000
In-Reply-To: <5B72860202000078001?= =?UTF-8?Q?DDAFF@suse.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTQvMDgvMTggMDk6MzQsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDE0LjA4LjE4IGF0
IDA5OjE5LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPj4gT24gMTQvMDgvMTggMDk6MDIsIEph
biBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4gT24gMTMuMDguMTggYXQgMTc6NDQsIDxqZ3Jvc3NAc3Vz
ZS5jb20+IHdyb3RlOgo+Pj4+IE9uIDEzLzA4LzE4IDE3OjI5LCBKYW4gQmV1bGljaCB3cm90ZToK
Pj4+Pj4+Pj4gT24gMTMuMDguMTggYXQgMTY6MjAsIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+
Pj4+Pj4gT24gMTMvMDgvMTggMTU6NTQsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4+Pj4+IE9u
IDEzLjA4LjE4IGF0IDE1OjA2LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPj4+Pj4+Pj4gU3Vn
Z2VzdGVkIG5ldyBpbnRlcmZhY2UKPj4+Pj4+Pj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPj4+
Pj4+Pj4gSHlwZXJjYWxscywgbWVtb3J5IG1hcChzKSBhbmQgQUNQSSB0YWJsZXMgc2hvdWxkIHN0
YXkgdGhlIHNhbWUgKGZvcgo+Pj4+Pj4+PiBjb21wYXRpYmlsaXR5IHJlYXNvbnMgb3IgYmVjYXVz
ZSB0aGV5IGFyZSBhcmNoaXRlY3R1cmFsIGludGVyZmFjZXMpLgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBB
cyB0aGUgbWFpbiBjb25mdXNpb24gaW4gdGhlIGN1cnJlbnQgaW50ZXJmYWNlIGlzIHJlbGF0ZWQg
dG8gdGhlCj4+Pj4+Pj4+IHNwZWNpZmljYXRpb24gb2YgdGhlIHRhcmdldCBtZW1vcnkgc2l6ZSB0
aGlzIHBhcnQgb2YgdGhlIGludGVyZmFjZQo+Pj4+Pj4+PiBzaG91bGQgYmUgY2hhbmdlZDogc3Bl
Y2lmeWluZyB0aGUgc2l6ZSBvZiB0aGUgYmFsbG9vbmVkIGFyZWEgaW5zdGVhZAo+Pj4+Pj4+PiBp
cyBtdWNoIGNsZWFyZXIgYW5kIHdpbGwgYmUgdGhlIHNhbWUgZm9yIGFsbCBndWVzdCB0eXBlcyAo
bm8gZmlybXdhcmUKPj4+Pj4+Pj4gbWVtb3J5IG9yIG1hZ2ljIGFkZGl0aW9ucyBpbnZvbHZlZCku
Cj4+Pj4+Pj4KPj4+Pj4+PiBCdXQgaXNuJ3QgdGhpcyBiYWNrd2FyZHM/IFRoZSBiYWxsb29uIHNp
emUgaXMgYSBwaWVjZSBvZiBpbmZvcm1hdGlvbgo+Pj4+Pj4+IGludGVybmFsIHRvIHRoZSBndWVz
dC4gV2h5IHNob3VsZCB0aGUgb3V0c2lkZSB3b3JsZCBrbm93IG9yIGNhcmU/Cj4+Pj4+Pgo+Pj4+
Pj4gSW5zdGVhZCBvZiBzcGVjaWZ5aW5nIGFuIGFic29sdXRlIHZhbHVlIHRvIHJlYWNoIHlvdSdk
IHNwZWNpZnkgaG93IG11Y2gKPj4+Pj4+IG1lbW9yeSB0aGUgZ3Vlc3Qgc2hvdWxkIHN0YXkgYmVs
b3cgaXRzIG1heGltdW0uIEkgdGhpbmsgdGhpcyBpcyBhIHZhbGlkCj4+Pj4+PiBhcHByb2FjaC4K
Pj4+Pj4KPj4+Pj4gQnV0IHdpdGggeW91IHZOVU1BIG1vZGVsIHRoZXJlJ3Mgbm8gc2luZ2xlIHN1
Y2ggdmFsdWUsIGFuZCBub3RoaW5nCj4+Pj4+IGxpa2UgYSAibWF4aW11bSIgKHdoaWNoIHdvdWxk
IG5lZWQgdG8gYmUgcGVyIHZpcnR1YWwgbm9kZSBhZmFpY3MpLgo+Pj4+Cj4+Pj4gV2l0aCB2TlVN
QSB0aGVyZSBpcyBhIGN1cnJlbnQgdmFsdWUgb2YgbWVtb3J5IHBlciBub2RlIHN1cHBsaWVkIGJ5
IHRoZQo+Pj4+IHRvb2xzIGFuZCBhIG1heGltdW0gcGVyIG5vZGUgY2FuIGJlIGNhY2x1bGF0ZWQg
dGhlIHNhbWUgd2F5Lgo+Pj4KPj4+IENhbiBpdD8gSWYgc28sIEkgbXVzdCBiZSBvdmVybG9va2lu
ZyBzb21lIGFjY291bnRpbmcgZG9uZQo+Pj4gc29tZXdoZXJlLiBJJ20gb25seSBhd2FyZSBvZiBh
IGdsb2JhbCBtYXhpbXVtLgo+Pgo+PiBUaGUgdG9vbHMgc2V0IHRoZSB2bnVtYSBpbmZvcm1hdGlv
biBmb3IgdGhlIGd1ZXN0LiBIb3cgZG8gdGhleSBkbyB0aGlzCj4+IHdpdGhvdXQga25vd2luZyB0
aGUgbWVtb3J5IHNpemUgcGVyIHZudW1hIG5vZGU/Cj4gCj4gVGhhdCdzIHRoZSBjdXJyZW50IChp
bml0aWFsKSBzaXplLCBub3QgdGhlIG1heGltdW0uCgpXaGljaCBpcyB0aGUgc2FtZSBpbiB0aGUg
Y3VycmVudCBpbXBsZW1lbnRhdGlvbjoKbGlieGxfX3ZudW1hX2NvbmZpZ19jaGVjaygpIHdpbGwg
ZmFpbCBpZiB0aGUgbWVtb3J5IG9mIGFsbCB2bnVtYSBub2Rlcwp3b24ndCBzdW0gdXAgdG8gdGhl
IG1heCBtZW1vcnkgb2YgdGhlIGRvbWFpbi4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
