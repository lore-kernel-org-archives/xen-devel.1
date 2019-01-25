From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH SpectreV1+L1TF v4 03/11] config: introduce
 L1TF_LFENCE option
Date: Fri, 25 Jan 2019 06:09:45 -0700
Message-ID: <5C4B0A990200007800211210@prv1-mh.provo.novell.com>
References: <1548244285-30813-1-git-send-email-nmanthey@amazon.de>
 <1548244285-30813-4-git-send-email-nmanthey@amazon.de>
 <c279c2fa-564a-7177-d305-38c907d485c3@citrix.com>
 <5C4AE16D0200007800211142@prv1-mh.provo.novell.com>
 <9c750e44-c37d-3c87-0add-195cf9299429@amazon.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8q7v=QB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gn1F2-0006EX-9W
 for xen-devel@lists.xenproject.org; Fri, 25 Jan 2019 13:09:52 +0000
In-Reply-To: <9c750e44-c37d-3c87-0add-195cf9299429@amazon.de>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: nmanthey@amazon.de
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Martin Pohlack <mpohlack@amazon.de>, Julien Grall <julien.grall@arm.com>, David Woodhouse <dwmw@amazon.co.uk>, "Martin Mazein(amazein)" <amazein@amazon.de>, xen-devel <xen-devel@lists.xenproject.org>, Julian Stecklina <jsteckli@amazon.de>, Bjoern Doebel <doebel@amazon.de>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI1LjAxLjE5IGF0IDExOjUwLCA8bm1hbnRoZXlAYW1hem9uLmRlPiB3cm90ZToKPiBP
biAxLzI1LzE5IDExOjE0LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4gT24gMjQuMDEuMTkgYXQg
MjI6MjksIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPj4+IFdvcnNlIGlzIHRo
ZSAiZXZhbHVhdGUgY29uZGl0aW9uLCBzdGFzaCByZXN1bHQsIGZlbmNlLCB1c2UgdmFyaWFibGUi
Cj4+PiBvcHRpb24sIHdoaWNoIGlzIGFsbW9zdCBjb21wbGV0ZWx5IHVzZWxlc3MuICBJZiB5b3Ug
d29yayBvdXQgdGhlCj4+PiByZXN1bHRpbmcgaW5zdHJ1Y3Rpb24gc3RyZWFtLCB5b3UnbGwgaGF2
ZSBhIGNvbmRpdGlvbmFsIGV4cHJlc3Npb24KPj4+IGNhbGN1bGF0ZWQgZG93biBpbnRvIGEgcmVn
aXN0ZXIsIHRoZW4gYSBmZW5jZSwgdGhlbiBhIHRlc3QgcmVnaXN0ZXIgYW5kCj4+PiBjb25kaXRp
b25hbCBqdW1wIGludG8gb25lIG9mIHR3byBiYXNpYyBibG9ja3MuICBUaGlzIHRha2VzIHRoZSBw
ZXJmIGhpdCwKPj4+IGFuZCBkb2Vzbid0IHByb3RlY3QgZWl0aGVyIG9mIHRoZSBiYXNpYyBibG9j
a3MgZm9yIHNwZWN1bGF0aXZlCj4+PiBtaXMtZXhlY3V0aW9uLgo+PiBIb3cgZG9lcyBpdCBub3Qg
cHJvdGVjdCBhbnl0aGluZz8gSXQgc2hyaW5rcyB0aGUgc3BlY3VsYXRpb24gd2luZG93Cj4+IHRv
IGp1c3QgdGhlIHJlZ2lzdGVyIHRlc3QgYW5kIGNvbmRpdGlvbmFsIGJyYW5jaCwgd2hpY2ggb3Vn
aHQgdG8gYmUKPj4gZmFyIHNtYWxsZXIgdGhhbiB0aGF0IGJlaGluZCBhIG1lbW9yeSBhY2Nlc3Mg
d2hpY2ggZmFpbHMgdG8gaGl0IGFueQo+PiBvZiB0aGUgY2FjaGVzIChhbmQgcGVyaGFwcyBldmVu
IGFueSBvZiB0aGUgVExCcykuIFRoaXMgaXMgdGhlIG1vcmUKPj4gdGhhdCBMRkVOQ0UgZG9lcyBz
cGVjaWZpY2FsbHkgbm90IHByZXZlbnQgaW5zbiBmZXRjaGluZyBmcm9tCj4+IGNvbnRpbnVpbmcu
Cj4+Cj4+IFRoYXQgc2FpZCBJIGFncmVlIHRoYXQgdGhlIExGRU5DRSB3b3VsZCBiZXR0ZXIgc2l0
IGJldHdlZW4gdGhlCj4+IHJlZ2lzdGVyIHRlc3QgYW5kIHRoZSBjb25kaXRpb25hbCBicmFuY2gs
IGJ1dCBhcyB3ZSd2ZSBzYWlkIHNvIG1hbnkKPj4gdGltZXMgYmVmb3JlIC0gdGhpcyBjYW4ndCBi
ZSBhY2hpZXZlZCB3aXRob3V0IGNvbXBpbGVyIHN1cHBvcnQuIEl0J3MKPj4gc2FpZCBlbm91Z2gg
dGhhdCB0aGUgZGVmYXVsdCAiY2MiIGNsb2JiZXIgb2YgYXNtKCktcyBvbiB4ODYgYWxvbmUKPj4g
cHJldmVudHMgdGhpcyBmcm9tIHBvc3NpYmx5IHdvcmtpbmcsIHdoaWxlIG15IG92ZXIgZm91ciB5
ZWFyIG9sZAo+PiBwYXRjaCB0byBhZGQgYSBtZWFucyB0byBhdm9pZCB0aGlzIGhhcyBub3Qgc2Vl
biBzdWZmaWNpZW50Cj4+IGNvbW1lbnRzIHRvIGdldCBpdCBpbnRvIHNvbWUgaG9wZWZ1bGx5IGFj
Y2VwdGFibGUgc2hhcGUsIGJ1dCBhbHNvCj4+IGhhcyBub3QgYmVlbiBhcHByb3ZlZCBhcyBpcy4K
Pj4KPj4gVGhlbiBhZ2FpbiwgZm9sbG93aW5nIGFuIGVhcmxpZXIgcmVwbHkgb2YgbWluZSBvbiBh
bm90aGVyIHN1Yi0KPj4gdGhyZWFkLCBub3RoaW5nIHJlYWxseSBwcmV2ZW50cyB0aGUgY29tcGls
ZXIgZnJvbSBtb3ZpbmcgYWhlYWQKPj4gYW5kIGZvbGRpbmcgdGhlIHR3byBMRkVOQ0VzIG9mIHRo
ZSAiYm90aCBicmFuY2hlcyIgbW9kZWwgaW50bwo+PiBvbmUuIEl0IGp1c3Qgc28gaGFwcGVucyB0
aGF0IGFwcGFyZW50bHkgcmlnaHQgbm93IHRoaXMgbmV2ZXIKPj4gb2NjdXJzIChhc3N1bWluZyBO
b3JiZXJ0IGhhcyBkb25lIGZ1bGwgZ2VuZXJhdGVkIGNvZGUgYW5hbHlzaXMKPj4gdG8gY29uZmly
bSB0aGUgaW50ZW5kZWQgcGxhY2VtZW50KS4KPiAKPiBJIGFtIGhhcHB5IHRvIGp1bXAgYmFjayB0
byBteSBlYXJsaWVyIHZlcnNpb24gd2l0aG91dCBhIGNvbmZpZ3VyYXRpb24KPiBvcHRpb24gdG8g
cHJvdGVjdCBib3RoIGJyYW5jaGVzIHdpdGggYSBsZmVuY2UgaW5zdHJ1Y3Rpb24sIHVzaW5nIGxv
Z2ljCj4gb3BlcmF0b3JzLgoKSSBkb24ndCB1bmRlcnN0YW5kIHRoaXMsIEknbSBhZnJhaWQ6IFdo
YXQgSSd2ZSBzYWlkIHdhcyB0byBzdXBwb3J0Cm15IHRoaW5raW5nIG9mIHRoZSAmJiArIHx8IHZh
cmlhbnQgYmVpbmcgaWRlbnRpY2FsIGluIGNvZGUgYW5kIHJpc2sKdG8gdGhhdCB1c2luZyA/OiAu
IEkuZS4gSSdtIG5vdCBhc2tpbmcgeW91IHRvIHN3aXRjaCBiYWNrLgoKSmFuCgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
