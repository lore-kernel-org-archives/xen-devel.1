From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2] libxl: put RSDP for PVH guest near 4GB
Date: Wed, 20 Dec 2017 11:42:15 +0000
Message-ID: <20171220114215.l2cdpx46d253ggpy@MacBook-Pro-de-Roger.local>
References: <20171201141407.21993-1-jgross@suse.com>
 <20171219153802.355ha2zrocgb6mes@MacBook-Pro-de-Roger.local>
 <3c4b702d-3029-3c38-c3da-1d83b722cef4@suse.com>
 <20171219161150.2tzo6icbplueu65g@MacBook-Pro-de-Roger.local>
 <ae894c7b-0945-c83c-48e5-4a0e709c22e2@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=wqkk=dq=citrix.com=prvs=52023da21=roger.pau@srs-us1.protection.inumbo.net>)
 id 1eRclZ-0004Jn-VT
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2017 11:42:29 +0000
Content-Disposition: inline
In-Reply-To: <ae894c7b-0945-c83c-48e5-4a0e709c22e2@suse.com>
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

T24gVHVlLCBEZWMgMTksIDIwMTcgYXQgMDU6MjA6NDFQTSArMDEwMCwgSnVlcmdlbiBHcm9zcyB3
cm90ZToKPiBPbiAxOS8xMi8xNyAxNzoxMSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+IE9u
IFR1ZSwgRGVjIDE5LCAyMDE3IGF0IDA0OjQ2OjM3UE0gKzAxMDAsIEp1ZXJnZW4gR3Jvc3Mgd3Jv
dGU6Cj4gPj4gT24gMTkvMTIvMTcgMTY6MzgsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4gPj4+
IE9uIEZyaSwgRGVjIDAxLCAyMDE3IGF0IDAzOjE0OjA3UE0gKzAxMDAsIEp1ZXJnZW4gR3Jvc3Mg
d3JvdGU6Cj4gPj4+PiBJbnN0ZWFkIG9mIGxvY2F0aW5nIHRoZSBSU0RQIHRhYmxlIGJlbG93IDFN
QiBwdXQgaXQganVzdCBiZWxvdyA0R0IKPiA+Pj4+IGxpa2UgdGhlIHJlc3Qgb2YgdGhlIEFDUEkg
dGFibGVzIGluIGNhc2Ugb2YgUFZIIGd1ZXN0cy4gVGhpcyB3aWxsCj4gPj4+PiBhdm9pZCBwdW5j
aGluZyBtb3JlIGhvbGVzIHRoYW4gbmVjZXNzYXJ5IGludG8gdGhlIG1lbW9yeSBtYXAuCj4gPj4+
Pgo+ID4+Pj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgo+
ID4+Pj4gQWNrZWQtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Cj4gPj4+PiAtLS0K
PiA+Pj4+ICB0b29scy9saWJ4Yy94Y19kb21faHZtbG9hZGVyLmMgfCAyICstCj4gPj4+PiAgdG9v
bHMvbGlieGwvbGlieGxfeDg2X2FjcGkuYyAgIHwgNSArKy0tLQo+ID4+Pj4gIDIgZmlsZXMgY2hh
bmdlZCwgMyBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+ID4+Pj4KPiA+Pj4+IGRpZmYg
LS1naXQgYS90b29scy9saWJ4Yy94Y19kb21faHZtbG9hZGVyLmMgYi90b29scy9saWJ4Yy94Y19k
b21faHZtbG9hZGVyLmMKPiA+Pj4+IGluZGV4IDU5Zjk0ZTUxZTUuLjNmMGJkNjU1NDcgMTAwNjQ0
Cj4gPj4+PiAtLS0gYS90b29scy9saWJ4Yy94Y19kb21faHZtbG9hZGVyLmMKPiA+Pj4+ICsrKyBi
L3Rvb2xzL2xpYnhjL3hjX2RvbV9odm1sb2FkZXIuYwo+ID4+Pj4gQEAgLTEzNiw3ICsxMzYsNyBA
QCBzdGF0aWMgaW50IG1vZHVsZV9pbml0X29uZShzdHJ1Y3QgeGNfZG9tX2ltYWdlICpkb20sCj4g
Pj4+PiAgICAgIHN0cnVjdCB4Y19kb21fc2VnIHNlZzsKPiA+Pj4+ICAgICAgdm9pZCAqZGVzdDsK
PiA+Pj4+ICAKPiA+Pj4+IC0gICAgaWYgKCBtb2R1bGUtPmxlbmd0aCApCj4gPj4+PiArICAgIGlm
ICggbW9kdWxlLT5sZW5ndGggJiYgIW1vZHVsZS0+Z3Vlc3RfYWRkcl9vdXQgKQo+ID4+Pgo+ID4+
PiBJc24ndCB0aGF0IGtpbmQgb2YgYSBzZXBhcmF0ZSBmaXg/IEFGQUlDVCB0aGlzIGp1c3QgcHJl
dmVudHMKPiA+Pj4gYWxsb2NhdGluZyBtZW1vcnkgaWYgZ3Vlc3RfYWRkcl9vdXQgaXMgYWxyZWFk
eSBzZXQgdG8gYSBmaXhlZAo+ID4+PiBwb3NpdGlvbi4KPiA+Pgo+ID4+IE5vLCB0aGlzIGlzIG1h
bmRhdG9yeSwgYXMgSSBoYXZlIHRvIHNraXAgdGhlIGFsbG9jYXRpb24gZm9yIFBWSCwgd2hpbGUK
PiA+PiBIVk0gZ3Vlc3RzIHJlYWxseSB3YW50IHRoZSBhbGxvY2F0aW9uIHRvIHRha2UgcGxhY2Uu
Cj4gPiAKPiA+IFdhcyB0aGlzIGFsc28gYSBwcm9ibGVtIGJlZm9yZT8gT3RoZXIgQUNQSSBtb2R1
bGVzIGFsc28gc2V0Cj4gPiBndWVzdF9hZGRyX291dCwgYW5kIHByZXZpb3VzbHkgdGhleSB3b3Vs
ZCBhbHNvIGdldCBtZW1vcnkgYWxsb2NhdGVkLgo+IAo+IG1vZHVsZV9pbml0X29uZSgpIHdvdWxk
IG9ubHkgYmUgY2FsbGVkIGZvciB0aGUgZmlyc3QgQUNQSSBtb2R1bGUsIHdoaWNoCj4gaGFwcGVu
cyB0byBiZSB0aGUgUlNEUC4KCk9LLCBJIGhhdmUgdG8gYWRtaXQgSSBmaW5kIGFsbCB0aGlzIHF1
aXRlIGNvbmZ1c2luZy4gSW4gYW55IGNhc2UsIHRoZQphcHByb2FjaCBzZWVtcyBjb3JyZWN0IHRv
IG1lLgoKUmV2aWV3ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29t
PgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
