From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: seabios: import build fix for newer iasl
Date: Wed, 29 Aug 2018 11:21:00 +0100
Message-ID: <20180829102057.t3z2z7p4tr6l2ef4@citrix.com>
References: <20180823105733.io65kk4rvtadbysn@mac>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=vupe=lm=citrix.com=prvs=7720ea622=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fuxay-00067O-4J
 for xen-devel@lists.xenproject.org; Wed, 29 Aug 2018 10:21:04 +0000
Content-Disposition: inline
In-Reply-To: <20180823105733.io65kk4rvtadbysn@mac>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBBdWcgMjMsIDIwMTggYXQgMTI6NTc6MzNQTSArMDIwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBIZWxsbywKPiAKPiBTZWFCSU9TIGN1cnJlbnRseSBmYWlscyB0byBidWlsZCB3
aXRoIG5ld2VyIHZlcnNpb25zIG9mIGlhc2wgZHVlIHRvOgo+IAo+ICAgQ29tcGlsaW5nIElBU0wg
c3JjL2Z3L3NzZHQtcGNpaHAuaGV4Cj4gb3V0L3NyYy9mdy9zc2R0LXBjaWhwLmRzbC5pICAgICAg
NTogRGVmaW5pdGlvbkJsb2NrICgic3NkdC1wY2locC5hbWwiLCAiU1NEVCIsIDB4MDEsICJCWFBD
IiwgIkJYU1NEVFBDSUhQIiwgMHgxKQo+IEVycm9yICAgIDYxNTUgLSAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgSW52YWxp
ZCBPRU0gVGFibGUgSUQgXiAgKExlbmd0aCBjYW5ub3QgZXhjZWVkIDggY2hhcmFjdGVycykKPiAK
PiBUaGlzIGhhcyBhbHJlYWR5IGJlZW4gZml4ZWQgdXBzdHJlYW0gYnkgY29tbWl0Cj4gOGMzZjU3
ZWExMjE3ZWEwYzgwYTcyODk4YmMzNWJhYTBlMTRhZjBlMDogInNzZHQ6IEZpeCBidWlsZGluZyBv
Zgo+IGxlZ2FjeSBhY3BpIHRhYmxlcyBvbiBjdXJyZW50IGlhc2wgY29tcGlsZXIiLgo+IAo+IFdv
dWxkIGl0IGJlIHBvc3NpYmxlIHRvIHBpY2sgdGhpcyBjb21taXQgaW50byBvdXIgYnJhbmNoLCBv
cgo+IGFsdGVybmF0aXZlbHkgc3dpdGNoIENvbmZpZy5tayBpbiB1bnN0YWJsZSB0byB1c2UgdGhl
IG1hc3RlciBzZWFiaW9zCj4gZ2l0IGJyYW5jaCBpbnN0ZWFkIG9mIHJlbC0xLjExLjE/CgpJIGNh
biBzd2l0Y2ggQ29uZmlnLm1rIHRvIHRyYWNrIDEuMTEtc3RhYmxlIGZvciBub3cgYW5kIGRlY2lk
ZSB3aGF0IHRvCmRvIGxhdGVyIHdoZW4gWGVuIGlzIGR1ZSB0byByZWxlYXNlIC0tIGl0IGNvdWxk
IGJlIHRoZSBjYXNlIHRoYXQKdXBzdHJlYW0gd2lsbCBoYXZlIHJlbGVhc2VkIGEgbmV3IHZlcnNp
b24gb2Ygc2VhYmlvcyBieSB0aGVuLgoKQXQgdGhlIGVuZCBvZiB0aGUgZGF5LCBJIHdvdWxkIHZl
cnkgbXVjaCBsaWtlIHRvIGF2b2lkIGRldmlhdGluZyBmcm9tCnVwc3RyZWFtLgoKV2VpLgoKPiAK
PiBUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
