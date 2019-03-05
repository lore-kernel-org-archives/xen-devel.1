From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH L1TF v9 7/7] common/grant_table: block
 speculative out-of-bound accesses
Date: Tue, 05 Mar 2019 09:38:37 -0700
Message-ID: <5C7EA60D020000780021BD0A@prv1-mh.provo.novell.com>
References: <1551284020-7050-1-git-send-email-nmanthey@amazon.de>
 <1551284020-7050-8-git-send-email-nmanthey@amazon.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=M+W2=RI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h1D5b-0007go-CC
 for xen-devel@lists.xenproject.org; Tue, 05 Mar 2019 16:38:47 +0000
In-Reply-To: <1551284020-7050-8-git-send-email-nmanthey@amazon.de>
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
Cc: Juergen Gross <jgross@suse.com>, Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Martin Pohlack <mpohlack@amazon.de>, wipawel@amazon.de, Julien Grall <julien.grall@arm.com>, David Woodhouse <dwmw@amazon.co.uk>, "Martin Mazein(amazein)" <amazein@amazon.de>, xen-devel <xen-devel@lists.xenproject.org>, Julian Stecklina <jsteckli@amazon.de>, Bjoern Doebel <doebel@amazon.de>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI3LjAyLjE5IGF0IDE3OjEzLCA8bm1hbnRoZXlAYW1hem9uLmRlPiB3cm90ZToKPiBT
cGVjdWxhdGl2ZSBleGVjdXRpb24gaXMgbm90IGJsb2NrZWQgaW4gY2FzZSBvbmUgb2YgdGhlIGZv
bGxvd2luZwo+IHByb3BlcnRpZXMgaXMgdHJ1ZToKPiAgLSBwYXRoIGNhbm5vdCBiZSB0cmlnZ2Vy
ZWQgYnkgdGhlIGd1ZXN0Cj4gIC0gcGF0aCBkb2VzIG5vdCByZXR1cm4gdG8gdGhlIGd1ZXN0Cj4g
IC0gcGF0aCBkb2VzIG5vdCByZXN1bHQgaW4gYW4gb3V0LW9mLWJvdW5kIGFjY2Vzcwo+ICAtIHBh
dGggY2Fubm90IGJlIGV4ZWN1dGVkIHJlcGVhdGVkbHkKPiBPbmx5IHRoZSBjb21iaW5hdGlvbiBv
ZiB0aGUgYWJvdmUgcHJvcGVydGllcyBhbGxvd3MgdG8gYWN0dWFsbHkgbGVhawo+IGNvbnRpbnVv
dXMgY2h1bmtzIG9mIG1lbW9yeS4gVGhlcmVmb3JlLCB3ZSBvbmx5IGFkZCB0aGUgcGVuYWx0eSBv
Zgo+IHByb3RlY3RpdmUgbWVjaGFuaXNtcyBpbiBjYXNlIGEgcG90ZW50aWFsIHNwZWN1bGF0aXZl
IG91dC1vZi1ib3VuZAo+IGFjY2VzcyBtYXRjaGVzIGFsbCB0aGUgYWJvdmUgcHJvcGVydGllcy4K
CldoaWxlIHRoaXMgaXMgYWxsIGZpbmUsIGhvdyBkbyBJIG1hdGNoIHdoaWNoIG9mIHRoZSByZWFz
b25zIGFwcGxpZXMgdG8Kd2hpY2ggb2YgKGluIHBhcnRpY3VsYXIpIHRoZSBndF92ZXJzaW9uIGNo
ZWNrcyBsZWZ0IGFsb25lPyBBcyBzYWlkLCB0aGUKcmVhc29uaW5nIGhlcmUgc2hvdWxkIHNwZWNp
ZmljYWxseSBiZSBkZXRhaWxlZCBzbyBpdCBjYW4gYmUgdXNlZCBhcyBhCmd1aWRpbmcgcmVmZXJl
bmNlIHdoZW4gYWRkaW5nIGZ1cnRoZXIgY29uZGl0aW9uYWxzIHRvIHRoZSBjb2RlIGRvd24KdGhl
IHJvYWQuIEFuZCBvZiBjb3Vyc2UgcmV2aWV3IGlzIChtb3JlKSBkaWZmaWN1bHQgdGhpcyB3YXkg
YXMgd2VsbCwgYXMKKGp1ZGdpbmcgZnJvbSBwcmlvciBjb252ZXJzYXRpb25zKSB3ZSBkb24ndCBz
ZWVtIHRvIG5lY2Vzc2FyaWx5CmFncmVlIGluIG91ciB2aWV3cyBpbiBhbGwgcGxhY2VzLCBhbmQg
aGVuY2UgdG8gZGlzY3VzcyBhIHBvc3NpYmx5CnF1ZXN0aW9uYWJsZSBkZWNpc2lvbiBvdGhlcnMg
YWxzbyBuZWVkIHRvIHVuZGVyc3RhbmQgd2hpY2ggb2YgdGhlCmNyaXRlcmlhIHlvdSBjb25zaWRl
cmVkIHRvIG1hdGNoIGluIHRoZSBzcGVjaWZpYyBjYXNlLgoKSmFuCgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
