From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v4 2/4] x86/clang: restore integrated
 assembler usage with indirect thunks
Date: Mon, 19 Feb 2018 08:57:15 -0700
Message-ID: <5A8B01EB02000078001A932E@prv-mh.provo.novell.com>
References: <20180219141620.20008-1-roger.pau@citrix.com>
 <20180219141620.20008-3-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=udnn=fn=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ennol-0001Ro-2C
 for xen-devel@lists.xenproject.org; Mon, 19 Feb 2018 15:57:27 +0000
In-Reply-To: <20180219141620.20008-3-roger.pau@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, IanJackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE5LjAyLjE4IGF0IDE1OjE2LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IC0tLSBhL0NvbmZpZy5tawo+ICsrKyBiL0NvbmZpZy5tawo+IEBAIC0xNTcsOSArMTU3LDkgQEAg
aWZuZGVmIFhFTl9IQVNfQ0hFQ0tQT0xJQ1kKPiAgZW5kaWYKPiAgCj4gICMgYXMtaW5zbjogQ2hl
Y2sgd2hldGhlciBhc3NlbWJsZXIgc3VwcG9ydHMgYW4gaW5zdHJ1Y3Rpb24uCj4gLSMgVXNhZ2U6
IGNmbGFncy15ICs9ICQoY2FsbCBhcy1pbnNuICJpbnNuIixvcHRpb24teWVzLG9wdGlvbi1ubykK
PiArIyBVc2FnZTogY2ZsYWdzLXkgKz0gJChjYWxsIGFzLWluc24gY2MgRkxBR1MsImluc24iLG9w
dGlvbi15ZXMsb3B0aW9uLW5vKQoKV2h5IGxvd2VyY2FzZSBjYyBhbmQgdXBwZXJjYXNlIEZMQUdT
PyBBbG9uZyB0aGUgbGluZXMgb2YgdGhlCnVzYWdlIGNvbW1lbnQgYWhlYWQgb2YgYXMtaW5zbi1j
aGVjayBib3RoIHNob3VsZCBiZSB1cHBlcmNhc2UuCgo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9SdWxl
cy5tawo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9SdWxlcy5tawo+IEBAIC00NCwzICs0NCwxNyBAQCBl
bmRpZgo+ICAKPiAgIyBTZXQgdXAgdGhlIGFzc2VtYmxlciBpbmNsdWRlIHBhdGggcHJvcGVybHkg
Zm9yIG9sZGVyIHRvb2xjaGFpbnMuCj4gIENGTEFHUyArPSAtV2EsLUkkKEJBU0VESVIpL2luY2x1
ZGUKPiArCj4gK2lmZXEgKCQoY2xhbmcpLHkpCj4gKyAgICAjIENoZWNrIHdoZXRoZXIgY2xhbmcg
YXNtKCktcyBzdXBwb3J0IC5pbmNsdWRlLgo+ICsgICAgaWZlcSAoJChjYWxsIGFzLWluc24sJChD
QykgJChDRkxBR1MpLCIuaW5jbHVkZSBcImFzbS9pbmRpcmVjdF90aHVua19hc20uaFwiIix5LG4p
LG4pCgpJcyB0aGVyZSBhbnl0aGluZyBrZWVwaW5nIHlvdSBmcm9tIHVzaW5nIHRoZSBzbGlnaHRs
eSBsZXNzIHVnbHkgdG8gdXNlCmFzLWluc24tY2hlY2sgaGVyZT8gT2gsIGl0J3MgYXBwYXJlbnRs
eSB0aGF0IHlvdSB3YW50IHRvIHVzZSBDRkxBR1MsCm5vdCBBRkxBR1MuIEkgd29uZGVyIHdoZXRo
ZXIgdGhlIG90aGVyIGFzLWluc24tY2hlY2sgdXNlcyB3b3VsZG4ndApiZXR0ZXIgaGF2ZSBDRkxB
R1MgcGFzc2VkIHRvby4gT3RoZXJ3aXNlIHBsZWFzZSBjbGFyaWZ5IHdoeSB0aGUKb3RoZXIgY29u
c3RydWN0IGNhbid0IGJlIHVzZWQgYnkgZXh0ZW5kaW5nIHRoZSBjb21tZW50LgoKPiArICAgICAg
ICBDRkxBR1MgKz0gLW5vLWludGVncmF0ZWQtYXMKPiArICAgICMgQ2hlY2sgd2hldGhlciBjbGFu
ZyBrZWVwcyAubWFjcm8tcyBiZXR3ZWVuIGFzbSgpLXM6Cj4gKyAgICAjIGh0dHBzOi8vYnVncy5s
bHZtLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MzYxMTAgCj4gKyAgICBlbHNlIGlmZXEgKCQoaWYgJChz
aGVsbCBlY2hvICd2b2lkIF8odm9pZCkgeyBhc20gdm9sYXRpbGUgKCAiLm1hY3JvIEZPT1xuLmVu
ZG0iICk7IFwKCkNhcmVmdWwgd2l0aCB0aGlzOyAuL1JFQURNRSBzdGlsbCBzYXlzICJHTlUgbWFr
ZSAzLjgwIG9yIGxhdGVyIiBhbmQKaWlyYyAzLjgwIGRvZXNuJ3Qgc3VwcG9ydCAiZWxzZSBpZi4u
LiIgb24gYSBzaW5nbGUgbGluZS4KCkphbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
