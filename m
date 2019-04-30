From: Juergen Gross <jgross@suse.com>
Subject: Re: vcpu_block() and do_poll() question
Date: Tue, 30 Apr 2019 12:44:59 +0200
Message-ID: <dd2eb4c4-4144-17ae-f7a6-a4287aeac461@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=9h7v=TA=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hLQG0-0004cK-7w
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2019 10:45:04 +0000
References: =?UTF-8?B?PDNjZTQ5OThi77+9YThhOO+/vTM3YmTvv71iYjI277+9OTU1MDU3?=
 =?UTF-8?Q?1709b6=40suse=2ecom=3e_=3c5CC82306020000780022A4E3=40prv1?=
 =?UTF-8?Q?=ef=bf=bdmh=2eprovo=2enovell=2ecom=3e_=3cae94fdca-bd2a-2086-450e-?=
 =?UTF-8?Q?c485ca4e59f0=40arm=2ecom=3e_=3c5CC82593020000780022A50D=40suse=2e?=
 =?UTF-8?Q?com=3e?=
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Julien Grall <julien.grall@arm.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Dario Faggioli <dfaggioli@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMzAvMDQvMjAxOSAxMjozOCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMzAuMDQuMTkg
YXQgMTI6MzEsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4gd3JvdGU6Cj4gCj4+Cj4+IE9uIDMwLzA0
LzIwMTkgMTE6MjcsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4gT24gMzAuMDQuMTkgYXQgMTE6
MTMsIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+Pj4+IEluIHhlbi9jb21tb24vc2NoZWR1bGUu
YyB0aGVyZSBpcyBhIHdlaXJkICIjaWZuZGVmIENPTkZJR19YODYiIGluCj4+Pj4gZG9fcG9sbCgp
Lgo+Pj4+Cj4+Pj4gSXQgd2FzIGludHJvZHVjZWQgd2F5IGJlZm9yZSBhbnlvbmUgd291bGQgdGhp
bmsgYWJvdXQgQVJNIGJ5IGNvbW1pdAo+Pj4+IGVmNGM2YjA3OWNjNTVlIChJIGNvdWxkbid0IGZp
bmQgYW55IHhlbi1kZXZlbCBtYWlsIHJlbGF0ZWQgdG8gdGhhdAo+Pj4+IGNvbW1pdCksIHNvIEkg
Z3Vlc3MgaXQgaXMgcmVsYXRlZCB0byBJQTY0Pwo+Pj4KPj4+IFF1aXRlIGNlcnRhaW5seSwgeWVz
IChvciBQUEMgYXMgYW4gYWx0ZXJuYXRpdmUsIGJ1dCBJIGtub3cgbm90aGluZwo+Pj4gYWJvdXQg
dGhlaXIgbWVtb3J5IG9yZGVyaW5nIG1vZGVsKS4KPj4+Cj4+Pj4gUXVlc3Rpb24gaXM6IGNhbiB3
ZSBqdXN0IGRyb3AgaXQsIG9yIGRvZXMgQVJNIGRlcGVuZCBvbiBpdD8gQW5kIGlmIEFSTQo+Pj4+
IHJlYWxseSBuZWVkcyBpdCwgaXMgaXQgdGhlIG1lbW9yeSBiYXJyaWVyIG9ubHk/IEFuZCB3aHkg
d291bGRuJ3QgYQo+Pj4+IHNpbWlsYXIgYmFycmllciBiZSBuZWVkZWQgaW4gdmNwdV9ibG9jaygp
IHRoZW4/Cj4+Pgo+Pj4gSXQncyBub3QgdGhlIG1lbW9yeSBiYXJyaWVyLCBidXQgdGhlIHN1YnNl
cXVlbnQgY2hlY2tzLiBUaGUgYmFycmllcgo+Pj4gaXMgdGhlcmUgb25seSB0byBtYWtlIHN1cmUg
dGhlIGNoZWNrcyBkb24ndCBoYXBwZW4gYmVmb3JlIHRoZQo+Pj4gZWFybGllciB3cml0ZXMuIEFu
ZCBhcyB0aGUgY29tbWVudCBzYXlzIC0gaXQncyB0aGUgY29tYmluYXRpb24gb2YKPj4+IHRoZSAz
IHdyaXRlcyB0aGF0IG1heSBnZXQgbWlzLW9yZGVyZWQgYW5kIGhlbmNlIG1pcy1pbnRlcnByZXRl
ZCBieQo+Pj4gb3RoZXIgKHJlYWRpbmcpIHBhcnRpZXMuIHZjcHVfYmxvY2soKSwgb3RvaCwgc2V0
cyB0aGUgVlBGX2Jsb2NrZWQKPj4+IGJpdCBvbmx5LCBzbyB0aGVyZSdzIG5vIHBvdGVudGlhbCBv
cmRlcmluZyBpc3N1ZSB0aGVyZS4KPj4KPj4gQXJlIHlvdSBzdWdnZXN0aW5nIHRoZSBjb21tZW50
IGluIHZjcHVfYmxvY2sgaXMgbm90IGNvcnJlY3Q/Cj4gCj4gTm8uIEJ1dCBJJ20gbm90IHRhbGtp
bmcgYWJvdXQgdGhlIGxvY2FsX2V2ZW50c19uZWVkX2RlbGl2ZXJ5KCkKPiBjaGVja3MgKHdoaWNo
IGV4aXN0IGluIGJvdGggZnVuY3Rpb25zKSwgYnV0IHRoZSBvbmVzIGluc2lkZSB0aGUKPiAjaWZk
ZWYgaW4gZG9fcG9sbCgpICh3aGljaCBoYXZlIG5vIGVxdWl2YWxlbnQgaW4gdmNwdV9ibG9jaygp
KS4KPiBUaGF0J3Mgbm90IHRvIHNheSB0aGF0IHRoZXJlIG1heSBub3QgbmVlZCB0byBiZSBhIGJh
cnJpZXIgYWhlYWQKPiBvZiBsb2NhbF9ldmVudHNfbmVlZF9kZWxpdmVyeSgpIGFzIHdlbGwgLSBJ
J3ZlIHNpbXBseSBub3QgdGhvdWdodAo+IHRocm91Z2ggdGhhdCBmdXJ0aGVyIGNhc2UgKHlldCku
CgpBbiBhbHRlcm5hdGl2ZSB3b3VsZCBiZSBtZW1vcnkgYmFycmllcnMgYmV0d2VlbiB0aGUgd3Jp
dGVzIG9uIEFSTSwKcmlnaHQ/IE9yIGEgc3Ryb25nIG9yZGVyZWQgc2V0X2JpdCgpIHZhcmlhbnQg
KHdlIGhhZCB0aGF0IGRpc2N1c3Npb24KcmVjZW50bHkgcmVsYXRlZCB0byBhIGJhcnJpZXIgaW4g
QVJNLXNwZWNpZmljIF9fY3B1X2Rpc2FibGUoKSkuCgpUaGVuIHdlIGNvdWxkIGRyb3AgdGhpcyAj
aWZuZGVmIHNlY3Rpb24uCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
