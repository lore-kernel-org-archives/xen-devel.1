From: Ryan Thibodeaux <thibodux@gmail.com>
Subject: Re: [PATCH] x86/xen: Add "xen_timer_slop" command line
 option
Date: Tue, 26 Mar 2019 07:41:32 -0400
Message-ID: <20190326114132.GA85724__23114.8802371294$1553600571$gmane$org@centos-dev.localdomain>
References: <1553279397-130201-1-git-send-email-ryan.thibodeaux@starlab.io>
 <abf65a68-9463-0f0e-1f51-6eefd3cacc88@oracle.com>
 <52bfeae7c256faec444b69efe58d363ad60c3fc5.camel@suse.com>
 <20190323114151.5cebf31b@sweethome>
 <20190325130530.56603806@luca64>
 <69e40698-f7ae-11c3-e4b7-dda4f1fadcf6@oracle.com>
 <a32c8b1d7866ee3b074b1d674b40e03e51dbd54a.camel@suse.com>
 <20190326121256.76ceed71@luca64>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fS3S=R5=gmail.com=thibodux@srs-us1.protection.inumbo.net>)
 id 1h8kSm-00058d-9Z
 for xen-devel@lists.xenproject.org; Tue, 26 Mar 2019 11:41:52 +0000
Received: by mail-yw1-xc43.google.com with SMTP id m207so401999ywd.5
 for <xen-devel@lists.xenproject.org>; Tue, 26 Mar 2019 04:41:50 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20190326121256.76ceed71@luca64>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: luca abeni <luca.abeni@santannapisa.it>
Cc: jgross@suse.com, oleksandr_andrushchenko@epam.com, linux-kernel@vger.kernel.org, Dario Faggioli <dfaggioli@suse.com>, ryan.thibodeaux@starlab.io, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, tglx@linutronix.de
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBNYXIgMjYsIDIwMTkgYXQgMTI6MTI6NTZQTSArMDEwMCwgbHVjYSBhYmVuaSB3cm90
ZToKPiBIaSBhbGwsCj4gCj4gT24gVHVlLCAyNiBNYXIgMjAxOSAxMDoxMzozMiArMDEwMAo+IERh
cmlvIEZhZ2dpb2xpIDxkZmFnZ2lvbGlAc3VzZS5jb20+IHdyb3RlOgo+IAo+ID4gT24gTW9uLCAy
MDE5LTAzLTI1IGF0IDA5OjQzIC0wNDAwLCBCb3JpcyBPc3Ryb3Zza3kgd3JvdGU6Cj4gPiA+IE9u
IDMvMjUvMTkgODowNSBBTSwgbHVjYSBhYmVuaSB3cm90ZTogIAo+ID4gPiA+IAo+ID4gPiA+IFRo
ZSBwaWN0dXJlIHNob3dzIHRoZSBsYXRlbmNpZXMgbWVhc3VyZWQgd2l0aCBhbiB1bnBhdGNoZWQg
Z3Vlc3QKPiA+ID4gPiBrZXJuZWwKPiA+ID4gPiBhbmQgd2l0aCBhIGd1ZXN0IGtlcm5lbCBoYXZp
bmcgVElNRVJfU0xPUCBzZXQgdG8gMTAwMCAoYXJiaXRyYXJ5Cj4gPiA+ID4gc21hbGwKPiA+ID4g
PiB2YWx1ZSA6KS4KPiA+ID4gPiBBbGwgdGhlIGV4cGVyaW1lbnRzIGhhdmUgYmVlbiBwZXJmb3Jt
ZWQgYm9vdGluZyB0aGUgaHlwZXJ2aXNvcgo+ID4gPiA+IHdpdGggYQo+ID4gPiA+IHNtYWxsIHRp
bWVyX3Nsb3AgKHRoZSBoeXBlcnZpc29yJ3Mgb25lKSB2YWx1ZS4gU28sIHRoZXkgc2hvdyB0aGF0
Cj4gPiA+ID4gZGVjcmVhc2luZyB0aGUgaHlwZXJ2aXNvcidzIHRpbWVyX3Nsb3AgaXMgbm90IGVu
b3VnaCB0byBtZWFzdXJlCj4gPiA+ID4gbG93IGxhdGVuY2llcyB3aXRoIGN5Y2xpY3Rlc3QuICAK
PiA+ID4gCj4gPiA+IEkgaGF2ZSBhIGNvdXBsZSBvZiBxdWVzdGlvbnM6Cj4gPiA+ICogRG9lcyBp
dCBtYWtlIHNlbnNlIHRvIG1ha2UgdGhpcyBhIHR1bmFibGUgZm9yIG90aGVyIGNsb2NrZXZlbnQK
PiA+ID4gZGV2aWNlcwo+ID4gPiBhcyB3ZWxsPwo+ID4gPiAgCj4gPiBTbywgQUZBSVVJLCB0aGUg
dGhpbmcgaXMgYXMgZm9sbG93cy4gSW4gY2xvY2tldmVudHNfcHJvZ3JhbV9ldmVudCgpLAo+ID4g
d2Uga2VlcCB0aGUgZGVsdGEgYmV0d2VlbiBub3cgYW5kIHRoZSBuZXh0IHRpbWVyIGV2ZW50IHdp
dGhpbgo+ID4gZGV2LT5tYXhfZGVsdGFfbnMgYW5kIGRldi0+bWluX2RlbHRhX25zOgo+ID4gCj4g
PiAgIGRlbHRhID0gbWluKGRlbHRhLCAoaW50NjRfdCkgZGV2LT5tYXhfZGVsdGFfbnMpOwo+ID4g
ICBkZWx0YSA9IG1heChkZWx0YSwgKGludDY0X3QpIGRldi0+bWluX2RlbHRhX25zKTsKPiA+IAo+
ID4gRm9yIFhlbiAod2VsbCwgZm9yIHRoZSBYZW4gY2xvY2spIHdlIGhhdmU6Cj4gPiAKPiA+ICAg
Lm1heF9kZWx0YV9ucyA9IDB4ZmZmZmZmZmYsCj4gPiAgIC5taW5fZGVsdGFfbnMgPSBUSU1FUl9T
TE9QLAo+ID4gCj4gPiB3aGljaCBtZWFucyBhIGd1ZXN0IGNhbid0IGFzayBmb3IgYSB0aW1lciB0
byBmaXJlIGVhcmxpZXIgdGhhbiAxMDB1cwo+IFsuLi5dCj4gCj4gSSBrbm93IHRoaXMgaXMgbm90
IGZ1bGx5IHJlbGF0ZWQgd2l0aCB0aGUgY3VycmVudCBkaXNjdXNzaW9uLCBidXQgaW4KPiB0aGVz
ZSBkYXlzIEkgaGFkIGEgbG9vayBhdCB0aGUgY29kZSBhZ2FpbiwgYW5kLi4uCj4gVGhlIGNvbW1l
bnQgZm9yIFRJTUVSX1NMT1AgaW4gYXJjaC94ODYveGVuL3RpbWUuYyBzYXlzOgo+IAkvKiBYZW4g
bWF5IGZpcmUgYSB0aW1lciB1cCB0byB0aGlzIG1hbnkgbnMgZWFybHkgKi8KPiAKPiBJc24ndCB0
aGUgY29tbWVudCB3cm9uZz8gc2hvdWxkbid0IGl0IGJlICIuLi5tYW55IG5zIGxhdGUiIGluc3Rl
YWQgb2YKPiAiZWFybHkiPwoKSSB3b3VsZCBzYXkgaXMgc29tZXRoaW5nIGVsc2UgZW50aXJlbHku
IAoKSWYgeW91IGxvb2sgYXQgImNsb2NrZXZlbnRzX3Byb2dyYW1fZXZlbnQoKSIgaW4ga2VybmVs
L3RpbWUvY2xvY2tldmVudHMuYywKeW91IHNlZSB0aGF0IHRoZSBtaW5fZGVsdGFfbnMgdmFsdWUg
c2V0cyB0aGUgbGltaXQgb3IgZ3JhbnVsYXJpeSBmb3IgdGhlCmNsb2NrJ3Mgc2xlZXAgdGltZS4K
CkJhc2ljYWxseSwgaXQgaXMgdGhlIG1pbmltdW0gYW1vdW50IG9mIHNsZWVwIG9uZSBjYW4gc2V0
IGZvciB0aGUgbmV4dApldmVudCBmb3IgdGhlIGNsb2NrIGluIHF1ZXN0aW9uLgoKLSBSeWFuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
