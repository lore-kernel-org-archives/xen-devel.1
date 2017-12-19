From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2] libxl: put RSDP for PVH guest near 4GB
Date: Tue, 19 Dec 2017 16:11:50 +0000
Message-ID: <20171219161150.2tzo6icbplueu65g@MacBook-Pro-de-Roger.local>
References: <20171201141407.21993-1-jgross@suse.com>
 <20171219153802.355ha2zrocgb6mes@MacBook-Pro-de-Roger.local>
 <3c4b702d-3029-3c38-c3da-1d83b722cef4@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=u91z=dp=citrix.com=prvs=519ad8697=roger.pau@srs-us1.protection.inumbo.net>)
 id 1eRKX2-0007gE-Gj
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2017 16:14:16 +0000
Content-Disposition: inline
In-Reply-To: <3c4b702d-3029-3c38-c3da-1d83b722cef4@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, wei.liu2@citrix.com, ian.jackson@eu.citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBEZWMgMTksIDIwMTcgYXQgMDQ6NDY6MzdQTSArMDEwMCwgSnVlcmdlbiBHcm9zcyB3
cm90ZToKPiBPbiAxOS8xMi8xNyAxNjozOCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+IE9u
IEZyaSwgRGVjIDAxLCAyMDE3IGF0IDAzOjE0OjA3UE0gKzAxMDAsIEp1ZXJnZW4gR3Jvc3Mgd3Jv
dGU6Cj4gPj4gSW5zdGVhZCBvZiBsb2NhdGluZyB0aGUgUlNEUCB0YWJsZSBiZWxvdyAxTUIgcHV0
IGl0IGp1c3QgYmVsb3cgNEdCCj4gPj4gbGlrZSB0aGUgcmVzdCBvZiB0aGUgQUNQSSB0YWJsZXMg
aW4gY2FzZSBvZiBQVkggZ3Vlc3RzLiBUaGlzIHdpbGwKPiA+PiBhdm9pZCBwdW5jaGluZyBtb3Jl
IGhvbGVzIHRoYW4gbmVjZXNzYXJ5IGludG8gdGhlIG1lbW9yeSBtYXAuCj4gPj4KPiA+PiBTaWdu
ZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4gPj4gQWNrZWQtYnk6
IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Cj4gPj4gLS0tCj4gPj4gIHRvb2xzL2xpYnhj
L3hjX2RvbV9odm1sb2FkZXIuYyB8IDIgKy0KPiA+PiAgdG9vbHMvbGlieGwvbGlieGxfeDg2X2Fj
cGkuYyAgIHwgNSArKy0tLQo+ID4+ICAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwg
NCBkZWxldGlvbnMoLSkKPiA+Pgo+ID4+IGRpZmYgLS1naXQgYS90b29scy9saWJ4Yy94Y19kb21f
aHZtbG9hZGVyLmMgYi90b29scy9saWJ4Yy94Y19kb21faHZtbG9hZGVyLmMKPiA+PiBpbmRleCA1
OWY5NGU1MWU1Li4zZjBiZDY1NTQ3IDEwMDY0NAo+ID4+IC0tLSBhL3Rvb2xzL2xpYnhjL3hjX2Rv
bV9odm1sb2FkZXIuYwo+ID4+ICsrKyBiL3Rvb2xzL2xpYnhjL3hjX2RvbV9odm1sb2FkZXIuYwo+
ID4+IEBAIC0xMzYsNyArMTM2LDcgQEAgc3RhdGljIGludCBtb2R1bGVfaW5pdF9vbmUoc3RydWN0
IHhjX2RvbV9pbWFnZSAqZG9tLAo+ID4+ICAgICAgc3RydWN0IHhjX2RvbV9zZWcgc2VnOwo+ID4+
ICAgICAgdm9pZCAqZGVzdDsKPiA+PiAgCj4gPj4gLSAgICBpZiAoIG1vZHVsZS0+bGVuZ3RoICkK
PiA+PiArICAgIGlmICggbW9kdWxlLT5sZW5ndGggJiYgIW1vZHVsZS0+Z3Vlc3RfYWRkcl9vdXQg
KQo+ID4gCj4gPiBJc24ndCB0aGF0IGtpbmQgb2YgYSBzZXBhcmF0ZSBmaXg/IEFGQUlDVCB0aGlz
IGp1c3QgcHJldmVudHMKPiA+IGFsbG9jYXRpbmcgbWVtb3J5IGlmIGd1ZXN0X2FkZHJfb3V0IGlz
IGFscmVhZHkgc2V0IHRvIGEgZml4ZWQKPiA+IHBvc2l0aW9uLgo+IAo+IE5vLCB0aGlzIGlzIG1h
bmRhdG9yeSwgYXMgSSBoYXZlIHRvIHNraXAgdGhlIGFsbG9jYXRpb24gZm9yIFBWSCwgd2hpbGUK
PiBIVk0gZ3Vlc3RzIHJlYWxseSB3YW50IHRoZSBhbGxvY2F0aW9uIHRvIHRha2UgcGxhY2UuCgpX
YXMgdGhpcyBhbHNvIGEgcHJvYmxlbSBiZWZvcmU/IE90aGVyIEFDUEkgbW9kdWxlcyBhbHNvIHNl
dApndWVzdF9hZGRyX291dCwgYW5kIHByZXZpb3VzbHkgdGhleSB3b3VsZCBhbHNvIGdldCBtZW1v
cnkgYWxsb2NhdGVkLgoKUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
