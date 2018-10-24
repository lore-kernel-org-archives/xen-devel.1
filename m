From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 3/5] tools/dombuilder: Initialise vcpu
 debug registers correctly
Date: Wed, 24 Oct 2018 14:03:05 +0100
Message-ID: <3f248088-e13d-da0a-9a2b-79bf0f3ee8d6@citrix.com>
References: <1539599780-14549-1-git-send-email-andrew.cooper3@citrix.com>
 <1539599780-14549-4-git-send-email-andrew.cooper3@citrix.com>
 <20181024130023.f2tyfoezlp6ahv3m@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20181024130023.f2tyfoezlp6ahv3m@zion.uk.xensource.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Ian Jackson <Ian.Jackson@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gMjQvMTAvMTggMTQ6MDAsIFdlaSBMaXUgd3JvdGU6Cj4gT24gTW9uLCBPY3QgMTUsIDIwMTgg
YXQgMTE6MzY6MThBTSArMDEwMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gSW4gcGFydGljdWxh
ciwgaW5pdGlhbGlzaW5nICVkcjYgd2l0aCB0aGUgdmFsdWUgMCBpcyBidWdneSwgYmVjYXVzZSBv
bgo+PiBoYXJkd2FyZSBzdXBwb3J0aW5nIFRyYW5zbmF0aW9uYWwgTWVtb3J5LCBpdCB3aWxsIGNh
dXNlIHRoZSBzdGlja3kgUlRNIGJpdCB0bwo+IFR5cG8gIlRyYW5zbmF0aW9uYWwiCgpZZWFoIC0g
SSBmaXhlZCBhbGwgb2YgdGhlbSBhZnRlciBKdWVyZ2VuIG5vdGljZWQuCgo+Cj4+IGJlIGFzc2Vy
dGVkLCBldmVuIHRob3VnaCBhIGRlYnVnIGV4Y2VwdGlvbiBmcm9tIGEgdHJhbnNhY3Rpb24gaGFz
bid0IGFjdHVhbGx5Cj4+IGJlZW4gb2JzZXJ2ZWQuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEFuZHJl
dyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4+IFJldmlld2VkLWJ5OiBKYW4g
QmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+IC0tLQo+PiBDQzogSWFuIEphY2tzb24gPElh
bi5KYWNrc29uQGNpdHJpeC5jb20+Cj4+IENDOiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29t
Pgo+PiBDQzogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4+Cj4+IFRo
ZSBjb3JyZWN0IHdheSB0byBkbyB0aGlzIHdvdWxkIGJlIHRvIGdldC9tb2RpZnkvc2V0IHRoZSB2
Y3B1IHN0YXRlLCBidXQgaXQKPj4gdHVybnMgb3V0IHRoYXQgaXMgaW1wb3NzaWJsZSBmb3IgYW4g
SFZNIHZjcHUgd2hpY2ggaGFzbid0IHlldCBoYWQgc3RhdGUgc2V0Lgo+PiBGaXhpbmcgdGhhdCBp
cyBnb2luZyB0byB0YWtlIHNvbWUgc3Vic3RhbnRpYWwgdW50YW5nbGluZyBmcm9tIGltcGxpY2F0
aW9ucyBpbgo+PiB0aGUgbWlncmF0aW9uIHN0cmVhbS4KPiBBY2tlZC1ieTogV2VpIExpdSA8d2Vp
LmxpdTJAY2l0cml4LmNvbT4KClRoYW5rcy4KCj4KPiBJIGhhdmVuJ3QgY2hlY2tlZCB0aGUgbWFu
dWFsIHJlIHRoZSB2YWx1ZSBvZiBkcjYsIGJ1dCBJIHRydXN0IEphbiBhbmQKPiBSb2dlcidzIHJl
dmlldyBvbiB0aGlzLgoKSW50ZWwgVm9sIDNhIFRhYmxlIDktMSwgb3IgQU1EIFZvbCAyIFRhYmxl
IDE0LTEgZm9yIGFueW9uZSB3aG8gd2FudHMgdG8KZG91YmxlIGNoZWNrIDopCgp+QW5kcmV3Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
