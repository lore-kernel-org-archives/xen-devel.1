From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v19 10/11] common: add a new mappable
 resource type: XENMEM_resource_grant_table
Date: Thu, 12 Apr 2018 09:28:17 -0600
Message-ID: <5ACF7B1102000078001BABCD@prv1-mh.provo.novell.com>
References: <20180329153616.2929-1-paul.durrant@citrix.com>
 <20180329153616.2929-11-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=9+ld=hb=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1f6e98-0005iP-26
 for xen-devel@lists.xenproject.org; Thu, 12 Apr 2018 15:28:22 +0000
In-Reply-To: <20180329153616.2929-11-paul.durrant@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI5LjAzLjE4IGF0IDE3OjM2LCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+IEBAIC05NjcsNiArOTY4LDU0IEBAIHN0YXRpYyBsb25nIHhhdHBfcGVybWlzc2lvbl9jaGVj
ayhzdHJ1Y3QgZG9tYWluICpkLCB1bnNpZ25lZCBpbnQgc3BhY2UpCj4gICAgICByZXR1cm4geHNt
X2FkZF90b19waHlzbWFwKFhTTV9UQVJHRVQsIGN1cnJlbnQtPmRvbWFpbiwgZCk7Cj4gIH0KPiAg
Cj4gK3N0YXRpYyBpbnQgYWNxdWlyZV9ncmFudF90YWJsZShzdHJ1Y3QgZG9tYWluICpkLCB1bnNp
Z25lZCBpbnQgaWQsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBs
b25nIGZyYW1lLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50
IG5yX2ZyYW1lcywKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHhlbl9wZm5fdCBt
Zm5fbGlzdFtdKQo+ICt7Cj4gKyAgICB1bnNpZ25lZCBpbnQgaSA9IG5yX2ZyYW1lczsKPiArCj4g
KyAgICAvKgo+ICsgICAgICogRklYTUU6IEl0IGlzIG5vdCBjdXJyZW50bHkgc2FmZSB0byBtYXAg
Z3JhbnQgc3RhdHVzIGZyYW1lcyBpZiB0aGV5Cj4gKyAgICAgKiAgICAgICAgd2lsbCBiZSBpbnNl
cnRlZCBpbnRvIHRoZSBjYWxsZXIncyBQMk0sIGJlY2F1c2UgdGhlc2UKPiArICAgICAqICAgICAg
ICBpbnNlcnRpb25zIGFyZSBub3QgeWV0IHByb3Blcmx5IHJlZmVyZW5jZSBjb3VudGVkLgo+ICsg
ICAgICogICAgICAgIFRoaXMgcmVzdHJpY3Rpb24gY2FuIGJlIHJlbW92ZWQgd2hlbiBhcHByb3By
aWF0ZSByZWZlcmVuY2UKPiArICAgICAqICAgICAgICBjb3VudGluZyBpcyBhZGRlZC4KPiArICAg
ICAqLwo+ICsgICAgaWYgKCBwYWdpbmdfbW9kZV90cmFuc2xhdGUoY3VycmVudC0+ZG9tYWluKSAm
Jgo+ICsgICAgICAgICAoaWQgPT0gWEVOTUVNX3Jlc291cmNlX2dyYW50X3RhYmxlX2lkX3N0YXR1
cykgKQo+ICsgICAgICAgIHJldHVybiAtRU9QTk9UU1VQUDsKCkkgZG9uJ3QgdW5kZXJzdGFuZCB3
aHkgdGhpcyBpcyBmb3Igc3RhdHVzIGZyYW1lcyBvbmx5OiBUaGUgcmVmY291bnRpbmcgcHJvYmxl
bQpleGlzdHMgaW4gYW55IGNhc2UgKGF0IHRoZSB2ZXJ5IGxlYXN0IHdoZW4gdGhlIGd1ZXN0IGdv
ZXMgYXdheSBidXQgdGhlIG1hcHBpbmcKZG9tYWluIHN1cnZpdmVzKS4gVGhlIGlvcmVxIHNlcnZl
ciB1c2UgaXMgZmluZSBiZWNhdXNlIHRoZSBwYWdlIGdldHMgYXNzaWduZWQKdG8gdGhlIGRvbWFp
biBpbnRlbmRlZCB0byBkbyB0aGUgbWFwcGluZy4KCkhvd2V2ZXIsIGJlc2lkZXMgdGlnaHRlbmlu
ZyB0aGUgY2hlY2ssIHRoZXJlIGNhbiBhbHNvIGJlIGEgbGl0dGxlIGJpdCBvZgpyZWxheGF0aW9u
LCBJIHRoaW5rOiBBdCBsZWFzdCB0aGUgaGFyZHdhcmUgZG9tYWluIGNhbiBkbyBzdWNoIG1hcHBp
bmdzLCBhcwp3ZSB0cnVzdCBpdCBhbnl3YXkgKGFuZCBpdCB3b24ndCAtIGZvciB0aGUgZm9yZXNl
ZWFibGUgZnV0dXJlIC0gZ28gYXdheSkuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
