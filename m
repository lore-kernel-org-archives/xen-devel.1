From: Juergen Gross <jgross@suse.com>
Subject: Re: [xen-unstable test] 128240: regressions - FAIL
Date: Tue, 2 Oct 2018 10:45:09 +0200
Message-ID: <ab5fb53c-4b78-7f8c-1dde-75c9b97d10a9@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ffqy=mo=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1g7GIs-0000WO-Ie
 for xen-devel@lists.xenproject.org; Tue, 02 Oct 2018 08:45:14 +0000
References: =?UTF-8?B?PG9zc3Rlc3Tvv70xMjgyNDDvv71tYWlucmVwb3J0QHhlbi5vcmc+?=
 =?UTF-8?Q?_=3c5BB1E30202000078001ED16E=40prv1=ef=bf=bdmh=2eprovo=2enovell?=
 =?UTF-8?Q?=2ecom=3e_=3c20181001143324=2en6ghsnarvq6xslqt=40zion=2euk=2exens?=
 =?UTF-8?Q?ource=2ecom=3e_=3c5BB238E102000078001ED56E=40prv1=ef=bf=bdmh=2epr?=
 =?UTF-8?Q?ovo=2enovell=2ecom=3e_=3c20181001151716=2esnpgmxh77crrmihq=40zion?=
 =?UTF-8?B?LnVrLnhlbnNvdXJjZS5jb20+IDwxNWFkODUzZu+/vWI5YWPvv71iYTBi77+9M2Nj?=
 =?UTF-8?Q?6=ef=bf=bd457b61ec787e=40citrix=2ecom=3e_=3c20181001153557=2ey4jg?=
 =?UTF-8?B?bzM3eHpiYWE1dGdnQHppb24udWsueGVuc291cmNlLmNvbT4gPGZjMmJiYzg577+9?=
 =?UTF-8?B?Y2ZjN++/vWQ5MDbvv702ZmUw77+9YjFmZDc2ZGRkMmZmQGNpdHJpeC5jb20+IDwy?=
 =?UTF-8?B?NjExMDcwNu+/vWExODPvv70wYzEx77+9MWVmZO+/vTkzZWM3NmFjY2Q0MEBjaXRy?=
 =?UTF-8?Q?ix=2ecom=3e_=3cffd0c284-c1c9-680c-564a-ce066a1fb210=40suse=2ecom?=
 =?UTF-8?Q?=3e_=3c5BB32C7802000078001ED8FA=40suse=2ecom=3e?=
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, George Dunlap <george.dunlap@citrix.com>, Wei Liu <wei.liu2@citrix.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, osstest service owner <osstest-admin@xenproject.org>, Dario Faggioli <dfaggioli@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDIvMTAvMjAxOCAxMDoyOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMDEuMTAuMTgg
YXQgMTg6MDcsIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+PiBPbiAwMS8xMC8yMDE4IDE3OjQ4
LCBHZW9yZ2UgRHVubGFwIHdyb3RlOgo+Pj4gT24gMTAvMDEvMjAxOCAwNDo0MCBQTSwgQW5kcmV3
IENvb3BlciB3cm90ZToKPj4+PiBJZiB0aGVyZSBpc24ndCBhbiBvYnZpb3VzIGZpeCwgdGhlbiB0
aGUgc3dpdGNoIG9mIGRlZmF1bHQgc2NoZWR1bGVyCj4+Pj4gbmVlZHMgcmV2ZXJ0aW5nIHVudGls
IHRoZXJlIGlzIGEgZml4IHByZXNlbnQuICBUaGlzIGlzIGN1cnJlbnRseQo+Pj4+IGJsb2NraW5n
IG1hc3Rlci4KPj4+Cj4+PiBBZ3JlZWQuICBJJ2QgYXJndWUgZm9yIGlnbm9yaW5nIGZhaWx1cmVz
IHRvIHNldCBzY2hlZHVsZXIgcGFyYW1ldGVycyBvbgo+Pj4gbWlncmF0ZSwgb24gdGhlIGdyb3Vu
ZHMgdGhhdCB0aGlzIHdpbGwgYmUgbGVzcyByaXNrIHRvIHRoZSBwcm9qZWN0IGFzIGEKPj4+IHdo
b2xlIHRoYW4gcmV2ZXJ0aW5nIGNyZWRpdDIgYWdhaW4uICBCdXQgZWl0aGVyIHdheSB3ZSBzaG91
bGQgZG8KPj4+IHNvbWV0aGluZyBxdWlja2x5Lgo+Pgo+PiBXZSBzaG91bGQgaWdub3JlIGEgbWlz
bWF0Y2ggb2YgdGhlIHNjaGVkdWxlci4gRmFpbHVyZXMgd2hlbiBzZXR0aW5nCj4+IHBhcmFtZXRl
cnMgZm9yIGEgbWF0Y2hpbmcgc2NoZWR1bGVyIHNob3VsZCBub3QgYmUgaWdub3JlZCBJTU8uCj4g
Cj4gV2VsbCwgZGVwZW5kcyBvbiB3aGV0aGVyIHRoZSBzY2hlZHVsZXIgd2FzIGV4cGxpY2l0bHkg
Y2hvc2VuLgo+IEkgZG9uJ3QgdGhpbmsgbWlncmF0aW9uIHNob3VsZCBzdWNjZWVkIHdoZW4gZS5n
LiBSVERTIHdhcyB1c2VkCj4gYW5kIGlzbid0IGF2YWlsYWJsZSBvbiB0aGUgZGVzdGluYXRpb24g
aG9zdC4KClRoZSBvbmx5IHdheSBJIGNvdWxkIHRoaW5rIG9mIHRvIHRlbGwgYW4gZXhwbGljaXQg
dnMuIGFuIGltcGxpY2l0CnNjaGVkdWxlciBzZWxlY3Rpb24gd291bGQgYmUgdG8gc3BlY2lmeSBh
IGNwdXBvb2wgaW4gdGhlIGRvbWFpbidzCmNvbmZpZyBmaWxlLgoKU28gd2hhdCBhYm91dCB0aGUg
Zm9sbG93aW5nOgoKQSBtaXNtYXRjaCBvZiB0aGUgc2NoZWR1bGVyIHNob3VsZCBiZSBpZ25vcmVk
IG9uIHRoZSByZWNlaXZpbmcgc2lkZQppZiBubyBjcHVwb29sIHdhcyBzcGVjaWZpZWQgZXhwbGlj
aXRseSBmb3IgdGhlIGRvbWFpbi4KCkkgaGF2ZSBjaGVja2VkIHRoYXQgY29uZmlnLmNfaW5mby5w
b29sX25hbWUgaW4gSlNPTiBkYXRhIGlzIGF2YWlsYWJsZQpvbmx5IGlmIHRoZSBjcHVwb29sIGlz
IHNwZWNpZmllZCBpbiB0aGUgZG9tYWluIGNvbmZpZy4KCgpKdWVyZ2VuCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
