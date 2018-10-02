From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [xen-unstable test] 128240: regressions - FAIL
Date: Tue, 02 Oct 2018 02:29:44 -0600
Message-ID: <5BB32C7802000078001ED8FA@prv1-mh.provo.novell.com>
References: <osstest-128240-mainreport@xen.org>
 <5BB1E30202000078001ED16E@prv1-mh.provo.novell.com>
 <20181001143324.n6ghsnarvq6xslqt@zion.uk.xensource.com>
 <5BB238E102000078001ED56E@prv1-mh.provo.novell.com>
 <20181001151716.snpgmxh77crrmihq@zion.uk.xensource.com>
 <15ad853f-b9ac-ba0b-3cc6-457b61ec787e@citrix.com>
 <20181001153557.y4jgo37xzbaa5tgg@zion.uk.xensource.com>
 <fc2bbc89-cfc7-d906-6fe0-b1fd76ddd2ff@citrix.com>
 <26110706-a183-0c11-1efd-93ec76accd40@citrix.com>
 <ffd0c284-c1c9-680c-564a-ce066a1fb210@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=0jmz=mo=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g7G41-0007LT-1v
 for xen-devel@lists.xenproject.org; Tue, 02 Oct 2018 08:29:53 +0000
In-Reply-To: <ffd0c284-c1c9-680c-564a-ce066a1fb210@suse.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: george.dunlap@citrix.com, Wei Liu <wei.liu2@citrix.com>, Juergen Gross <jgross@suse.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Dario Faggioli <dario.faggioli@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, osstest service owner <osstest-admin@xenproject.org>, Dario Faggioli <dfaggioli@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAxLjEwLjE4IGF0IDE4OjA3LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBPbiAw
MS8xMC8yMDE4IDE3OjQ4LCBHZW9yZ2UgRHVubGFwIHdyb3RlOgo+PiBPbiAxMC8wMS8yMDE4IDA0
OjQwIFBNLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+Pj4gSWYgdGhlcmUgaXNuJ3QgYW4gb2J2aW91
cyBmaXgsIHRoZW4gdGhlIHN3aXRjaCBvZiBkZWZhdWx0IHNjaGVkdWxlcgo+Pj4gbmVlZHMgcmV2
ZXJ0aW5nIHVudGlsIHRoZXJlIGlzIGEgZml4IHByZXNlbnQuICBUaGlzIGlzIGN1cnJlbnRseQo+
Pj4gYmxvY2tpbmcgbWFzdGVyLgo+PiAKPj4gQWdyZWVkLiAgSSdkIGFyZ3VlIGZvciBpZ25vcmlu
ZyBmYWlsdXJlcyB0byBzZXQgc2NoZWR1bGVyIHBhcmFtZXRlcnMgb24KPj4gbWlncmF0ZSwgb24g
dGhlIGdyb3VuZHMgdGhhdCB0aGlzIHdpbGwgYmUgbGVzcyByaXNrIHRvIHRoZSBwcm9qZWN0IGFz
IGEKPj4gd2hvbGUgdGhhbiByZXZlcnRpbmcgY3JlZGl0MiBhZ2Fpbi4gIEJ1dCBlaXRoZXIgd2F5
IHdlIHNob3VsZCBkbwo+PiBzb21ldGhpbmcgcXVpY2tseS4KPiAKPiBXZSBzaG91bGQgaWdub3Jl
IGEgbWlzbWF0Y2ggb2YgdGhlIHNjaGVkdWxlci4gRmFpbHVyZXMgd2hlbiBzZXR0aW5nCj4gcGFy
YW1ldGVycyBmb3IgYSBtYXRjaGluZyBzY2hlZHVsZXIgc2hvdWxkIG5vdCBiZSBpZ25vcmVkIElN
Ty4KCldlbGwsIGRlcGVuZHMgb24gd2hldGhlciB0aGUgc2NoZWR1bGVyIHdhcyBleHBsaWNpdGx5
IGNob3Nlbi4KSSBkb24ndCB0aGluayBtaWdyYXRpb24gc2hvdWxkIHN1Y2NlZWQgd2hlbiBlLmcu
IFJURFMgd2FzIHVzZWQKYW5kIGlzbid0IGF2YWlsYWJsZSBvbiB0aGUgZGVzdGluYXRpb24gaG9z
dC4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
