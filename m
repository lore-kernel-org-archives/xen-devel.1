From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 06/13] libx86: Introduce a helper to
 serialise a cpuid_policy object
Date: Wed, 04 Jul 2018 02:51:04 -0600
Message-ID: <5B3C8A7802000078001D0E6E@prv1-mh.provo.novell.com>
References: <1530651326-5320-1-git-send-email-andrew.cooper3@citrix.com>
 <1530651326-5320-7-git-send-email-andrew.cooper3@citrix.com>
 <20180704084239.fk7cianiscggg3sz@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180704084239.fk7cianiscggg3sz@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA0LjA3LjE4IGF0IDEwOjQyLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
T24gVHVlLCBKdWwgMDMsIDIwMTggYXQgMDk6NTU6MTlQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPj4gLS0tIGEveGVuL2luY2x1ZGUvcHVibGljL2FyY2gteDg2L3hlbi5oCj4+ICsrKyBi
L3hlbi9pbmNsdWRlL3B1YmxpYy9hcmNoLXg4Ni94ZW4uaAo+PiBAQCAtMzE0LDYgKzMxNCwxNyBA
QCBzdHJ1Y3QgeGVuX2FyY2hfZG9tYWluY29uZmlnIHsKPj4gICNkZWZpbmUgWEVOX0FDUElfR1BF
MF9DUFVIUF9CSVQgICAgICAyCj4+ICAjZW5kaWYKPj4gIAo+PiArLyoKPj4gKyAqIFJlcHJlc2Vu
dGF0aW9ucyBvZiBhcmNoaXRlY3R1cmFsIENQVUlEIGluZm9ybWF0aW9uLiAgVXNlZCBhcyB0aGUK
Pj4gKyAqIHNlcmlhbGlzZWQgdmVyc2lvbiBvZiBYZW4ncyBpbnRlcm5hbCByZXByZXNlbnRhdGlv
bi4KPj4gKyAqLwo+PiArdHlwZWRlZiBzdHJ1Y3QgeGVuX2NwdWlkX2xlYWYgewo+PiArI2RlZmlu
ZSBYRU5fQ1BVSURfTk9fU1VCTEVBRiAweGZmZmZmZmZmdQo+PiArICAgIHVpbnQzMl90IGxlYWYs
IHN1YmxlYWY7Cj4+ICsgICAgdWludDMyX3QgYSwgYiwgYywgZDsKPj4gK30geGVuX2NwdWlkX2xl
YWZfdDsKPj4gK0RFRklORV9YRU5fR1VFU1RfSEFORExFKHhlbl9jcHVpZF9sZWFmX3QpOwo+PiAr
Cj4gCj4gSXMgcHV0dGluZyB0aGlzIGluIHB1YmxpYyBoZWFkZXIgd2hpbGUgbGVhdmluZwo+IENQ
VUlEX01BWF9TRVJJQUxJU0VEX0xFQVZFUyBpbiBhIHByaXZhdGUgaGVhZGVyIHVzZWZ1bD8KPiAK
PiBIb3cgZG9lcyBhbiBleHRlcm5hbCB1c2VyIGtub3cgaG93IGJpZyBhIGJ1ZmZlciBpdCBuZWVk
cyB0byBwcm92aWRlIHRvCj4gYWNjb21tb2RhdGUgdGhlIHJldHVybiBzdHJ1Y3R1cmU/CgpZZWFo
LCB0aGlzIGlzIGluZGVlZCBoYXJkIHRvIHRlbGwgZnJvbSB0aGlzIHBhdGNoIGFsb25lLiBBbmQg
Z29pbmcKb3ZlciB0aGUgdGl0bGVzIG9mIHRoZSByZW1haW5kZXIgb2YgdGhlIHNlcmllcyBpdCdz
IGFsc28gbm90IGNsZWFyCndoZXJlIGEgdXNlIG9mIHRoaXMgc3RydWN0dXJlIGluIGEgZG9tY3Rs
L3N5c2N0bCB3b3VsZCBhcHBlYXIuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
