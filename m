From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v3 5/5] x86/domctl: Implement
 XEN_DOMCTL_get_cpu_policy
Date: Mon, 5 Nov 2018 15:55:46 +0000
Message-ID: <20181105155546.p3fauk6c67tvx4aj@zion.uk.xensource.com>
References: <1541416600-30056-1-git-send-email-andrew.cooper3@citrix.com>
 <1541416600-30056-6-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <1541416600-30056-6-git-send-email-andrew.cooper3@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Jan Beulich <JBeulich@suse.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBOb3YgMDUsIDIwMTggYXQgMTE6MTY6NDBBTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBGcm9tOiBTZXJnZXkgRHlhc2xpIDxzZXJnZXkuZHlhc2xpQGNpdHJpeC5jb20+Cj4g
Cj4gVGhpcyBmaW5hbGx5IChhZnRlciBsaXRlcmFsbHkgeWVhcnMgb2Ygd29yayEpIG1hcmtzIHRo
ZSBwb2ludCB3aGVyZSB0aGUKPiB0b29sc3RhY2sgY2FuIGFzayB0aGUgaHlwZXJ2aXNvciBmb3Ig
dGhlIGN1cnJlbnQgQ1BVSUQgY29uZmlndXJhdGlvbiBvZiBhCj4gc3BlY2lmaWMgZG9tYWluLgo+
IAo+IEludHJvZHVjZSBhIG5ldyBmbGFzayBhY2Nlc3MgdmVjdG9yIGFuZCB1cGRhdGUgdGhlIGRl
ZmF1bHQgcG9saWNpZXMuCj4gCj4gQWxzbyBleHRlbmQgeGVuLWNwdWlkJ3MgLS1wb2xpY3kgbW9k
ZSB0byBiZSBhYmxlIHRvIHRha2UgYSBkb21pZCBhbmQgZHVtcCBhCj4gc3BlY2lmaWMgZG9tYWlu
cyBDUFVJRCBhbmQgTVNSIHBvbGljeS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVy
IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+IFNpZ25lZC1vZmYtYnk6IFNlcmdleSBEeWFz
bGkgPHNlcmdleS5keWFzbGlAY2l0cml4LmNvbT4KPiAtLS0KPiBDQzogSmFuIEJldWxpY2ggPEpC
ZXVsaWNoQHN1c2UuY29tPgo+IENDOiBJYW4gSmFja3NvbiA8SWFuLkphY2tzb25AZXUuY2l0cml4
LmNvbT4KPiBDQzogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KPiBDQzogUm9nZXIgUGF1
IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gQ0M6IFNlcmdleSBEeWFzbGkgPHNlcmdl
eS5keWFzbGlAY2l0cml4LmNvbT4KPiBDQzogRGFuaWVsIERlIEdyYWFmIDxkZ2RlZ3JhQHR5Y2hv
Lm5zYS5nb3Y+Cj4gCj4gdjM6Cj4gICogTWlzYyBjb2RlIGh5Z2VuZQo+ICAqIEZpeCBjb21tZW50
cyB0byBhdm9pZCBoYXZpbmcgYSBTWVNDVEwvRE9NQ1RMIHBhc3RlIGVycm9yCj4gICogSW50cm9k
dWNlIGEgbmV3IGZsYXNrIHZlY3RvciByYXRoZXIgdGhhbiByZXVzaW5nIHNldF9jcHVpZAo+IC0t
LQo+ICB0b29scy9mbGFzay9wb2xpY3kvbW9kdWxlcy9kb20wLnRlICB8ICAyICstCj4gIHRvb2xz
L2ZsYXNrL3BvbGljeS9tb2R1bGVzL3hlbi5pZiAgIHwgIDIgKy0KPiAgdG9vbHMvbGlieGMvaW5j
bHVkZS94ZW5jdHJsLmggICAgICAgfCAgMyArKwo+ICB0b29scy9saWJ4Yy94Y19jcHVpZF94ODYu
YyAgICAgICAgICB8IDM4ICsrKysrKysrKysrKysrKysrKysrKysrKwo+ICB0b29scy9taXNjL3hl
bi1jcHVpZC5jICAgICAgICAgICAgICB8IDU4ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrLS0tLS0KCkFja2VkLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
