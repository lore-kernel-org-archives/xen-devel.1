From: Douglas Goldstein <dougtrav@icloud.com>
Subject: Re: [PATCH] build: sync Kconfig with Linux v4.17
Date: Thu, 21 Jun 2018 16:44:52 +0800
Message-ID: <4657C7D5-3597-4DE8-A964-EDFF4F865812@icloud.com>
References: <20180621021052.27070-1-dougtrav@icloud.com>
 <5B2B5E2602000078001CC9AA@prv1-mh.provo.novell.com>
 <8c868712-81c0-86ba-038c-710ca6710173@citrix.com>
 <5B2B63BE02000078001CC9F4@prv1-mh.provo.novell.com>
Mime-Version: 1.0 (Mac OS X Mail 11.4 \(3445.8.2\))
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=2wxh=jh=icloud.com=dougtrav@srs-us1.protection.inumbo.net>)
 id 1fVvDD-00037h-9k
 for xen-devel@lists.xenproject.org; Thu, 21 Jun 2018 08:45:03 +0000
Received: from process-dkim-sign-daemon.mr28p48im-tydg10101201.me.com by
 mr28p48im-tydg10101201.me.com
 (Oracle Communications Messaging Server 8.0.1.2.20170607 64bit (built Jun  7
 2017)) id <0PAO00K00058TB00@mr28p48im-tydg10101201.me.com> for
 xen-devel@lists.xenproject.org; Thu, 21 Jun 2018 08:45:01 +0000 (GMT)
In-reply-to: <5B2B63BE02000078001CC9F4@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, Doug Goldstein <cardoe@cardoe.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Cgo+IE9uIEp1biAyMSwgMjAxOCwgYXQgNDozNyBQTSwgSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1
c2UuY29tPiB3cm90ZToKPiAKPj4+PiBPbiAyMS4wNi4xOCBhdCAxMDoyOCwgPGFuZHJldy5jb29w
ZXIzQGNpdHJpeC5jb20+IHdyb3RlOgo+PiBPbiAyMS8wNi8xOCAxNjoxMywgSmFuIEJldWxpY2gg
d3JvdGU6Cj4+Pj4+PiBPbiAyMS4wNi4xOCBhdCAwNDoxMCwgPGRvdWd0cmF2QGljbG91ZC5jb20+
IHdyb3RlOgo+Pj4+IEZyb206IERvdWcgR29sZHN0ZWluIDxjYXJkb2VAY2FyZG9lLmNvbT4KPj4+
PiAKPj4+PiBGcm9tOiBEb3VnIEdvbGRzdGVpbiA8Y2FyZG9lQGNhcmRvZS5jb20+Cj4+Pj4gCj4+
Pj4gSW1wb3J0IHRoZSBmb2xsb3dpbmcgZmlsZXMgYW5kIGRpcmVjdG9yaWVzIGZyb20gdGhlIExp
bnV4IHY0LjE3IHRhZwo+Pj4+IChjb21taXQgaWQgMjlkY2VhODg3NzljODU2YzdkYzkyMDQwYTBj
MDEyMzMyNjMxMDFkNCk6Cj4+Pj4gLSBzY3JpcHRzL2tjb25maWcvIC0+IHhlbi90b29scy9rY29u
ZmlnLwo+Pj4+IC0gc2NyaXB0cy9NYWtlZmlsZS5ob3N0IC0+IHhlbi90b29scy9rY29uZmlnL01h
a2VmaWxlLmhvc3QKPj4+PiAtIERvY3VtZW50YXRpb24va2J1aWxkL2tjb25maWd7LC1sYW5ndWFn
ZX0udHh0IC0+Cj4+Pj4gIGRvY3MvbWlzYy9rY29uZmlney1sYW5ndWFnZX0udHh0Cj4+Pj4gLSBp
bmNsdWRlL2xpbnV4L2tjb25maWcuaCAtPiB4ZW4vaW5jbHVkZS94ZW4va2NvbmZpZy5oCj4+Pj4g
Cj4+Pj4gUHVsbGVkIGluIHBhcnRzIG9mIHNjcmlwdHMvTWFrZWZpbGUubGliIGludG8KPj4+PiB4
ZW4vdG9vbHMva2NvbmZpZy9NYWtlZmlsZS5rY29uZmlnCj4+Pj4gCj4+Pj4gU2lkZSBlZmZlY3Qg
b2YgdGhpcyBjaGFuZ2UgaXMgdGhhdCBmbGV4IGFuZCBiaXNvbiBhcmUgcmVxdWlyZWQgdG8gYnVp
bGQKPj4+PiBLY29uZmlnLiBMaW51eCBoYXMgc3dpdGNoZWQgZnJvbSBzaGlwcGluZyB0aGUgcHJl
LWdlbmVyYXRlZCBmaWxlcyB0bwo+Pj4+IGFsd2F5cyBnZW5lcmF0aW5nIHRoZW0gd2l0aCBmbGV4
IGFuZCBiaXNvbi4KPj4+PiAKPj4+PiBTaWduZWQtb2ZmLWJ5OiBEb3VnIEdvbGRzdGVpbiA8Y2Fy
ZG9lQGNhcmRvZS5jb20+Cj4+PiBXaGF0IEknbSBtaXNzaW5nIChhbmQgd2hhdCBJIHRoaW5rIGlz
IGEgcmVxdWlyZW1lbnQgZm9yIHRoaXMgdG8gZ28gaW4pIGlzCj4+PiB0aGUgIndoeSIgcGFydDog
V2hhdCBkbyB3ZSBnYWluIGZyb20gZG9pbmcgdGhlIHVwZGF0ZT8gQmVzaWRlcyB0aGF0Cj4+PiBJ
IHRoaW5rIHRoYXQgaW4gZ2VuZXJhbCBpdCB3b3VsZCBiZSBiZXR0ZXIgdG8gcHVsbCBpbiBMaW51
eCBjb21taXRzIG9uZQo+Pj4gYnkgb25lLCByYXRoZXIgdGhhbiBjb21iaW5pbmcgZXZlcnl0aGlu
ZyBpbnRvIGEgZ2lhbnQgcGF0Y2guIFRoYXQKPj4+IG1pZ2h0IGV2ZW4gYWxyZWFkeSBhZGRyZXNz
IHBhcnQgb2YgbXkgcXVlc3Rpb24sIGFzIGl0IGNvdWxkIGhpZ2hsaWdodAo+Pj4gYnVnIGZpeGVz
IGFuZC9vciBlbmhhbmNlbWVudHMgd2hpY2ggYXJlIG9mIGludGVyZXN0IHRvIHVzLgo+PiAKPj4g
QXMgYSBmaXJzdCBwYXNzLCAiYmVjYXVzZSBtdWx0aXBsZSBwZW9wbGUgc3BlY2lmaWNhbGx5IGFz
a2VkIGFib3V0IHdoZW4KPj4gd2Ugd2VyZSBnb2luZyB0byB1cGRhdGUgdGhlIHZlcnNpb24gb2Yg
S2NvbmZpZyIuCj4gCj4gT2theSwgSSBtdXN0IGhhdmUgbWlzc2VkIGV2ZXJ5IG9uZSBvZiB0aGVz
ZS4gQW5kIGhlbmNlIEknbSB1bmF3YXJlCj4gb2YgdGhlICJ3aHkiIHBhcnRzIG9mIHRoZXNlIHJl
cXVlc3RzLgoKSXQgd2FzIGFza2VkIGR1cmluZyBtdWx0aXBsZSBzZXNzaW9ucyBhdCB0aGUgWGVu
IERldmVsb3BlciBTdW1taXQgaW4gTmFuamluZyBieSBhdWRpZW5jZSBtZW1iZXJzLgoKPiAKPj4g
V29ya2luZyBwYXRjaCBieSBwYXRjaCBpc24ndCBmZWFzaWJsZSBiZWNhdXNlIG9mIHRoZSByZW5h
bWVzLgo+IAo+IEkgZG9uJ3QgdW5kZXJzdGFuZCAtIGhvdyBkb2VzIHBhdGgvZmlsZSBuYW1pbmcg
Y29uZmxpY3Qgd2l0aCB3b3JraW5nCj4gcGF0Y2ggYnkgcGF0Y2g/IFN1cmVseSBhIHJlbGF0aXZl
bHkgc2ltcGxlIHNlZCBjb21tYW5kIGNvdWxkIGJlIHVzZWQKPiB0byBjaGFuZ2UgdGhlIHBhdGhz
IGluIGVhY2ggcGF0Y2ggYWNjb3JkaW5nIHRvIG91ciB0cmVlIGxheW91dC4gVGhhdCdzCj4gYmFz
aWNhbGx5IHdoYXQgSSdtIGRvaW5nIHdpdGggdGhlIE1XQUlUIGlkbGUgZHJpdmVyOyBncmFudGVk
LCB0aGF0J3MganVzdAo+IGEgc2luZ2xlIGZpbGUuCgpJdHMgMTA2IGNvbW1pdHMgYmV0d2VlbiB0
aGUgbGFzdCB0aW1lIEkgZ290IHRoaXMgaW4gc3luYy4gV2UgYWxzbyBkb27igJl0IGhhdmUga2J1
aWxkIGFuZCB3ZSBoYXZlIGEgbGl0dGxlIHNoaW0gZmlsZSB0byBtYXAgdGhpbmdzIHRvIG91ciBi
dWlsZCBzeXN0ZW0gc28gZm9yIGVhY2ggcGF0Y2ggSSB3b3VsZCBoYXZlIHRvIGltcGxlbWVudCBz
b21lIG9mIHRob3NlIHJlZ3Jlc3Npb25zLgoK4oCUCkRvdWcgCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
